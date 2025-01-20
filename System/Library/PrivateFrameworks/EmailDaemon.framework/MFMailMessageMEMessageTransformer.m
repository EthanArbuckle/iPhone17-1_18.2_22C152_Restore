@interface MFMailMessageMEMessageTransformer
- (id)messageForMailMessage:(id)a3;
@end

@implementation MFMailMessageMEMessageTransformer

- (id)messageForMailMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 headers];
  uint64_t v5 = [v4 headersDictionary];

  v23 = (void *)v5;
  v6 = [v3 messageBodyIfAvailable];
  v7 = [v6 rawData];

  v8 = [v3 to];
  if ([v8 count])
  {
    v26 = [v3 to];
  }
  else
  {
    v26 = &__NSArray0__struct;
  }

  v9 = [v3 cc];
  if ([v9 count])
  {
    v25 = [v3 cc];
  }
  else
  {
    v25 = &__NSArray0__struct;
  }

  v10 = [v3 bcc];
  if ([v10 count])
  {
    v24 = [v3 bcc];
  }
  else
  {
    v24 = &__NSArray0__struct;
  }

  id v11 = [objc_alloc((Class)MEMessageRecipients) initWithStringsTo:v26 cc:v25 bcc:v24 replyTo:&__NSArray0__struct];
  id v12 = objc_alloc((Class)MEEmailAddress);
  v13 = [v3 from];
  v14 = [v13 firstObject];
  id v15 = [v12 initWithRawString:v14];

  id v16 = objc_alloc((Class)MEMessage);
  v17 = [v3 subject];
  v18 = [v17 subjectString];
  v19 = [v3 dateSent];
  v20 = [v3 dateReceived];
  id v21 = [v16 initWithState:0 encryptionState:0 signatureState:0 subject:v18 recipients:v11 from:v15 dataSent:v19 dateReceived:v20 headers:v23 rawData:v7 senderMetadata:0];

  return v21;
}

@end