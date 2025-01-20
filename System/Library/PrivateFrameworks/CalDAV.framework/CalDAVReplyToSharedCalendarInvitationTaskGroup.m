@interface CalDAVReplyToSharedCalendarInvitationTaskGroup
- (BOOL)acceptInvitation;
- (CalDAVCalendarServerInviteNotificationItem)invitation;
- (CalDAVReplyToSharedCalendarInvitationTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4;
- (CalDAVReplyToSharedCalendarInvitationTaskGroup)initWithInvitation:(id)a3 acceptInvitation:(BOOL)a4 atCalendarHomeURL:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7;
- (NSURL)calendarHomeURL;
- (NSURL)sharedAs;
- (id)generateReply;
- (void)setAcceptInvitation:(BOOL)a3;
- (void)setCalendarHomeURL:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setSharedAs:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVReplyToSharedCalendarInvitationTaskGroup

- (CalDAVReplyToSharedCalendarInvitationTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Initializing this class instance with an inherited initializer not allowed." userInfo:0];
  objc_exception_throw(v7);
}

- (CalDAVReplyToSharedCalendarInvitationTaskGroup)initWithInvitation:(id)a3 acceptInvitation:(BOOL)a4 atCalendarHomeURL:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CalDAVReplyToSharedCalendarInvitationTaskGroup;
  v14 = [(CoreDAVTaskGroup *)&v17 initWithAccountInfoProvider:a6 taskManager:a7];
  v15 = v14;
  if (v14)
  {
    [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)v14 setInvitation:v12];
    [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)v15 setAcceptInvitation:v10];
    [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)v15 setCalendarHomeURL:v13];
  }

  return v15;
}

- (void)startTaskGroup
{
  v3 = [CalDAVPostWithSharedAsResponse alloc];
  v4 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self generateReply];
  id v5 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self calendarHomeURL];
  v8 = [(CoreDAVPostTask *)v3 initWithDataPayload:v4 dataContentType:@"text/xml" atURL:v5 previousETag:0];

  id v6 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [(CalDAVPostWithSharedAsResponse *)v8 setAccountInfoProvider:v6];

  [(CalDAVPostWithSharedAsResponse *)v8 setDelegate:self];
  id v7 = [(CoreDAVTaskGroup *)self taskManager];
  [v7 submitQueuedCoreDAVTask:v8];
}

- (id)generateReply
{
  id v3 = objc_alloc_init(MEMORY[0x263F34BB8]);
  uint64_t v4 = *MEMORY[0x263F34DA8];
  objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:");
  uint64_t v5 = *MEMORY[0x263F34E50];
  uint64_t v6 = *MEMORY[0x263F34E10];
  id v7 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self invitation];
  v8 = [v7 href];
  v9 = [v8 payloadAsString];
  [v3 appendElement:v5 inNamespace:v6 withStringContent:v9 withAttributeNamesAndValues:0];

  BOOL v10 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self acceptInvitation];
  v11 = cdXMLCalendarServerInviteAccepted;
  if (!v10) {
    v11 = cdXMLCalendarServerInviteDeclined;
  }
  [v3 appendElement:*v11 inNamespace:v4 withStringContent:0 withAttributeNamesAndValues:0];
  [v3 startElement:@"hosturl" inNamespace:v4 withAttributeNamesAndValues:0];
  id v12 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self invitation];
  id v13 = [v12 hostURL];
  v14 = [v13 href];
  v15 = [v14 payloadAsString];
  [v3 appendElement:v5 inNamespace:v6 withStringContent:v15 withAttributeNamesAndValues:0];

  [v3 endElement:@"hosturl" inNamespace:v4];
  v16 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self invitation];
  objc_super v17 = [v16 uid];
  v18 = [v17 payloadAsString];
  [v3 appendElement:@"in-reply-to" inNamespace:v4 withStringContent:v18 withAttributeNamesAndValues:0];

  v19 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self invitation];
  v20 = [v19 summary];

  if (v20)
  {
    v21 = [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self invitation];
    v22 = [v21 summary];
    v23 = [v22 payloadAsString];
    [v3 appendElement:@"summary" inNamespace:v4 withStringContent:v23 withAttributeNamesAndValues:0];
  }
  [v3 endElement:@"invite-reply" inNamespace:v4];
  v24 = [v3 data];

  return v24;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v12 = a4;
  uint64_t v6 = [a3 responseBodyParser];
  if (!v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 rootElement];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v9 = [v6 rootElement];
        BOOL v10 = [v9 href];
        v11 = [v10 payloadAsFullURL];
        [(CalDAVReplyToSharedCalendarInvitationTaskGroup *)self setSharedAs:v11];
      }
    }
  }
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v12 delegateCallbackBlock:0];
}

- (NSURL)sharedAs
{
  return self->_sharedAs;
}

- (void)setSharedAs:(id)a3
{
}

- (CalDAVCalendarServerInviteNotificationItem)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (BOOL)acceptInvitation
{
  return self->_acceptInvitation;
}

- (void)setAcceptInvitation:(BOOL)a3
{
  self->_acceptInvitation = a3;
}

- (NSURL)calendarHomeURL
{
  return self->_calendarHomeURL;
}

- (void)setCalendarHomeURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarHomeURL, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_sharedAs, 0);
}

@end