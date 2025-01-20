@interface BCSNFCReaderURLRecord
- (BCSNFCReaderURLRecord)initWithURL:(id)a3 message:(id)a4;
- (NFNdefMessage)message;
- (NSURL)url;
@end

@implementation BCSNFCReaderURLRecord

- (BCSNFCReaderURLRecord)initWithURL:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSNFCReaderURLRecord;
  v9 = [(BCSNFCReaderURLRecord *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_message, a4);
    v11 = v10;
  }

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (NFNdefMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end