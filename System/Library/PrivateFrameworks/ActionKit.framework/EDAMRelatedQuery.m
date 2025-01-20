@interface EDAMRelatedQuery
+ (id)structFields;
+ (id)structName;
- (EDAMNoteFilter)filter;
- (NSString)cacheKey;
- (NSString)context;
- (NSString)noteGuid;
- (NSString)plainText;
- (NSString)referenceUri;
- (void)setCacheKey:(id)a3;
- (void)setContext:(id)a3;
- (void)setFilter:(id)a3;
- (void)setNoteGuid:(id)a3;
- (void)setPlainText:(id)a3;
- (void)setReferenceUri:(id)a3;
@end

@implementation EDAMRelatedQuery

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1071;
  if (!structFields_structFields_1071)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"noteGuid"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"plainText"];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:12 optional:1 name:@"filter" structClass:objc_opt_class()];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"referenceUri"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"context"];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"cacheKey"];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_1071;
    structFields_structFields_1071 = v9;

    v2 = (void *)structFields_structFields_1071;
  }
  return v2;
}

+ (id)structName
{
  return @"RelatedQuery";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_referenceUri, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
}

- (void)setCacheKey:(id)a3
{
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setReferenceUri:(id)a3
{
}

- (NSString)referenceUri
{
  return self->_referenceUri;
}

- (void)setFilter:(id)a3
{
}

- (EDAMNoteFilter)filter
{
  return self->_filter;
}

- (void)setPlainText:(id)a3
{
}

- (NSString)plainText
{
  return self->_plainText;
}

- (void)setNoteGuid:(id)a3
{
}

- (NSString)noteGuid
{
  return self->_noteGuid;
}

@end