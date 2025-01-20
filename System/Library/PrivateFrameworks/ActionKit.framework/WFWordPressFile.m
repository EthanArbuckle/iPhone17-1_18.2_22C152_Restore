@interface WFWordPressFile
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)fileIdJSONTransformer;
- (NSNumber)fileId;
- (NSString)filename;
- (NSString)type;
- (NSURL)url;
@end

@implementation WFWordPressFile

+ (id)fileIdJSONTransformer
{
  return +[WFWordPressBlog blogIdJSONTransformer];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = @"fileId";
  v4[1] = @"filename";
  v5[0] = @"id";
  v5[1] = @"file";
  v4[2] = @"url";
  v4[3] = @"type";
  v5[2] = @"url";
  v5[3] = @"type";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileId, 0);
}

- (NSString)type
{
  return self->_type;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSNumber)fileId
{
  return self->_fileId;
}

@end