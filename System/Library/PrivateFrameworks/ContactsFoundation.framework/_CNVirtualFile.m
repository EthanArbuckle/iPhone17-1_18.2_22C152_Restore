@interface _CNVirtualFile
- (NSData)contents;
- (NSMutableDictionary)extendedAttributes;
- (_CNVirtualFile)init;
- (void)setContents:(id)a3;
@end

@implementation _CNVirtualFile

- (_CNVirtualFile)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CNVirtualFile;
  v2 = [(_CNVirtualFile *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] data];
    contents = v2->_contents;
    v2->_contents = (NSData *)v3;

    uint64_t v5 = objc_opt_new();
    extendedAttributes = v2->_extendedAttributes;
    v2->_extendedAttributes = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSData)contents
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContents:(id)a3
{
}

- (NSMutableDictionary)extendedAttributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedAttributes, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

@end