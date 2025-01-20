@interface CalDAVModifyCalendarSharingLevelTaskGroup
- (CalDAVModifyCalendarSharingLevelTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4;
- (CalDAVModifyCalendarSharingLevelTaskGroup)initWithSharingAction:(int)a3 atCalendarURL:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6;
- (NSURL)publishedURL;
- (NSURL)url;
- (int)action;
- (int)state;
- (void)finishWithError:(id)a3;
- (void)setAction:(int)a3;
- (void)setPublishedURL:(id)a3;
- (void)setState:(int)a3;
- (void)setUrl:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVModifyCalendarSharingLevelTaskGroup

- (CalDAVModifyCalendarSharingLevelTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Initializing this class instance with an inherited initializer not allowed." userInfo:0];
  objc_exception_throw(v7);
}

- (CalDAVModifyCalendarSharingLevelTaskGroup)initWithSharingAction:(int)a3 atCalendarURL:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalDAVModifyCalendarSharingLevelTaskGroup;
  v11 = [(CoreDAVTaskGroup *)&v14 initWithAccountInfoProvider:a5 taskManager:a6];
  v12 = v11;
  if (v11)
  {
    [(CalDAVModifyCalendarSharingLevelTaskGroup *)v11 setAction:v8];
    [(CalDAVModifyCalendarSharingLevelTaskGroup *)v12 setUrl:v10];
    [(CalDAVModifyCalendarSharingLevelTaskGroup *)v12 setState:0];
  }

  return v12;
}

- (void)startTaskGroup
{
  switch([(CalDAVModifyCalendarSharingLevelTaskGroup *)self action])
  {
    case 0:
      id v3 = objc_alloc_init(MEMORY[0x263F34BB8]);
      v4 = v3;
      id v5 = cdXMLCalendarServerPublishCalendar;
      goto LABEL_4;
    case 1:
      id v3 = objc_alloc_init(MEMORY[0x263F34BB8]);
      v4 = v3;
      id v5 = cdXMLCalendarServerUnpublishCalendar;
LABEL_4:
      [v3 appendElement:*v5 inNamespace:*MEMORY[0x263F34DA8] withStringContent:0 withAttributeNamesAndValues:0];
      id v6 = objc_alloc(MEMORY[0x263F34B70]);
      id v7 = [v4 data];
      uint64_t v8 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)self url];
      id v16 = (id)[v6 initWithDataPayload:v7 dataContentType:@"text/xml" atURL:v8 previousETag:0];
      uint64_t v9 = 1;
      goto LABEL_7;
    case 2:
      id v10 = objc_alloc(MEMORY[0x263F34B00]);
      v4 = (void *)[v10 initWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34EF8] parseClass:objc_opt_class()];
      id v11 = objc_alloc(MEMORY[0x263F34B80]);
      id v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
      uint64_t v8 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)self url];
      uint64_t v9 = 2;
      id v16 = (id)[v11 initWithPropertiesToFind:v7 atURL:v8 withDepth:2];
      goto LABEL_7;
    case 3:
      id v12 = objc_alloc(MEMORY[0x263F34B00]);
      v4 = (void *)[v12 initWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34EF8] parseClass:objc_opt_class()];
      id v13 = objc_alloc(MEMORY[0x263F34B80]);
      id v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
      uint64_t v8 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)self url];
      id v16 = (id)[v13 initWithPropertiesToFind:v7 atURL:v8 withDepth:2];
      uint64_t v9 = 3;
LABEL_7:

      [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setState:v9];
      if (v16)
      {
        objc_super v14 = [(CoreDAVTaskGroup *)self accountInfoProvider];
        [v16 setAccountInfoProvider:v14];

        [v16 setDelegate:self];
        v15 = [(CoreDAVTaskGroup *)self taskManager];
        [v15 submitQueuedCoreDAVTask:v16];
      }
      break;
    default:
      return;
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  if (!v6)
  {
    switch([(CalDAVModifyCalendarSharingLevelTaskGroup *)self state])
    {
      case 1:
        id v9 = objc_alloc(MEMORY[0x263F34B00]);
        id v10 = (void *)[v9 initWithNameSpace:*MEMORY[0x263F34DA8] name:*MEMORY[0x263F34D68] parseClass:objc_opt_class()];
        id v11 = objc_alloc(MEMORY[0x263F34B80]);
        id v12 = [MEMORY[0x263EFFA08] setWithObject:v10];
        id v13 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)self url];
        objc_super v14 = (void *)[v11 initWithPropertiesToFind:v12 atURL:v13 withDepth:2];

        v15 = [(CoreDAVTaskGroup *)self accountInfoProvider];
        [v14 setAccountInfoProvider:v15];

        [v14 setDelegate:self];
        [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setState:6];
        goto LABEL_13;
      case 2:
        id v16 = [v30 successfulValueForNameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34EF8]];
        id v10 = v16;
        if (!v16) {
          goto LABEL_14;
        }
        v17 = [v16 sharedOwner];

        if (v17) {
          goto LABEL_14;
        }
        id v18 = objc_alloc(MEMORY[0x263F34B20]);
        v19 = (void *)[v18 initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"shared-owner"];
        [v10 setSharedOwner:v19];

        goto LABEL_12;
      case 3:
        v20 = [v30 successfulValueForNameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34EF8]];
        id v10 = v20;
        if (v20
          && ([v20 sharedOwner], v21 = objc_claimAutoreleasedReturnValue(),
                                                v21,
                                                v21))
        {
          [v10 setSharedOwner:0];
LABEL_12:
          id v22 = objc_alloc(MEMORY[0x263F34B88]);
          v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v10, 0);
          v24 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)self url];
          objc_super v14 = (void *)[v22 initWithPropertiesToSet:v23 andRemove:0 atURL:v24];

          [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setState:4];
          v25 = [(CoreDAVTaskGroup *)self accountInfoProvider];
          [v14 setAccountInfoProvider:v25];

          [v14 setDelegate:self];
LABEL_13:
          v26 = [(CoreDAVTaskGroup *)self taskManager];
          [v26 submitQueuedCoreDAVTask:v14];
        }
        else
        {
LABEL_14:
          [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setState:7];
          [(CalDAVModifyCalendarSharingLevelTaskGroup *)self finishWithError:0];
        }

        goto LABEL_16;
      case 6:
        v27 = [v30 successfulValueForNameSpace:*MEMORY[0x263F34DA8] elementName:*MEMORY[0x263F34D68]];
        v28 = [v27 href];
        v29 = [v28 payloadAsFullURL];
        [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setPublishedURL:v29];

        goto LABEL_20;
      default:
LABEL_20:
        [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setState:7];
        id v7 = self;
        id v8 = 0;
        goto LABEL_3;
    }
  }
  [(CalDAVModifyCalendarSharingLevelTaskGroup *)self setState:7];
  id v7 = self;
  id v8 = v6;
LABEL_3:
  [(CalDAVModifyCalendarSharingLevelTaskGroup *)v7 finishWithError:v8];
LABEL_16:
}

- (void)finishWithError:(id)a3
{
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)setPublishedURL:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
}

@end