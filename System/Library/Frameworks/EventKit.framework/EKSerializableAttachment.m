@interface EKSerializableAttachment
+ (id)classesForKey;
- (EKSerializableAttachment)initWithAttachment:(id)a3;
- (NSString)contentTypeFromServer;
- (NSURL)urlOnDisk;
- (id)createAttachment;
- (void)setContentTypeFromServer:(id)a3;
- (void)setUrlOnDisk:(id)a3;
@end

@implementation EKSerializableAttachment

+ (id)classesForKey
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (EKSerializableAttachment)initWithAttachment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKSerializableAttachment;
  return [(EKSerializableAttachment *)&v4 init];
}

- (id)createAttachment
{
  return 0;
}

- (NSURL)urlOnDisk
{
  return self->_urlOnDisk;
}

- (void)setUrlOnDisk:(id)a3
{
}

- (NSString)contentTypeFromServer
{
  return self->_contentTypeFromServer;
}

- (void)setContentTypeFromServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeFromServer, 0);

  objc_storeStrong((id *)&self->_urlOnDisk, 0);
}

@end