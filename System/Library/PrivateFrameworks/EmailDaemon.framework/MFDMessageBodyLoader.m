@interface MFDMessageBodyLoader
+ (id)exportedInterface;
- (void)_loadMessages:(id)a3 completion:(id)a4;
- (void)loadBodiesOfMessagesContainingSubject:(id)a3 completion:(id)a4;
- (void)loadBodyOfMessageWithID:(id)a3 completion:(id)a4;
@end

@implementation MFDMessageBodyLoader

+ (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDMessageBodyLoaderProtocol];
}

- (void)loadBodyOfMessageWithID:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (pthread_main_np())
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MFDMessageBodyLoader.m" lineNumber:24 description:@"Current thread is main"];
  }
  v8 = +[MFMailMessageLibrary defaultInstance];
  v9 = [v8 messagesWithMessageIDHeader:v11];

  [(MFDMessageBodyLoader *)self _loadMessages:v9 completion:v7];
}

- (void)loadBodiesOfMessagesContainingSubject:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (pthread_main_np())
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MFDMessageBodyLoader.m" lineNumber:31 description:@"Current thread is main"];
  }
  id v8 = [objc_alloc((Class)MFMessageCriterion) initWithType:1 qualifier:0 expression:v12];
  [v8 setCriterionIdentifier:ECMessageHeaderKeySubject];
  v9 = +[MFMailMessageLibrary defaultInstance];
  v10 = [v9 messagesMatchingCriterion:v8 options:6297663];

  [(MFDMessageBodyLoader *)self _loadMessages:v10 completion:v7];
}

- (void)_loadMessages:(id)a3 completion:(id)a4
{
  id v18 = a3;
  v19 = (void (**)(id, void, id))a4;
  if (![v18 count])
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"No matching message found in library";
    id obj = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSDMessageBodyLoaderErrorDomain, 404);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    uint64_t v6 = 0;

    goto LABEL_14;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v18;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v23;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      id v11 = objc_alloc((Class)MFMessageLoadingContext);
      id v12 = +[DaemonAppController sharedController];
      v13 = [v12 defaultAttachmentManager];
      id v14 = [v11 initWithMessage:v10 attachmentManager:v13];

      v15 = +[EFScheduler immediateScheduler];
      [v14 load:1 scheduler:v15];

      LODWORD(v15) = [v14 hasLoadedSomeContent];
      v6 += v15;
      v7 += v15 ^ 1;
    }
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  }
  while (v5);

  if (v7)
  {
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Could not load %lu of %lu messages from network", v7, [obj count]);
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    uint64_t v29 = v16;
    id obja = (id)v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v5 = +[NSError errorWithDomain:MSDMessageBodyLoaderErrorDomain code:503 userInfo:v17];
  }
  else
  {
    id v5 = 0;
  }
LABEL_14:
  v19[2](v19, v6, v5);
}

@end