@interface IMTextMessageAttributedStringContent
- (IMTextMessageAttributedStringContent)initWithMessageBodyWithNativeAttributes:(id)a3 fileTransferGuids:(id)a4;
- (NSArray)fileTransferGuids;
- (NSAttributedString)messageBodyWithNativeAttributes;
@end

@implementation IMTextMessageAttributedStringContent

- (IMTextMessageAttributedStringContent)initWithMessageBodyWithNativeAttributes:(id)a3 fileTransferGuids:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMTextMessageAttributedStringContent;
  v8 = [(IMTextMessageAttributedStringContent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    messageBodyWithNativeAttributes = v8->_messageBodyWithNativeAttributes;
    v8->_messageBodyWithNativeAttributes = (NSAttributedString *)v9;

    uint64_t v11 = [v7 copy];
    fileTransferGuids = v8->_fileTransferGuids;
    v8->_fileTransferGuids = (NSArray *)v11;
  }
  return v8;
}

- (NSAttributedString)messageBodyWithNativeAttributes
{
  return self->_messageBodyWithNativeAttributes;
}

- (NSArray)fileTransferGuids
{
  return self->_fileTransferGuids;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferGuids, 0);

  objc_storeStrong((id *)&self->_messageBodyWithNativeAttributes, 0);
}

@end