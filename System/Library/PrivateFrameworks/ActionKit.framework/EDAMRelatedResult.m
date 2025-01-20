@interface EDAMRelatedResult
+ (id)structFields;
+ (id)structName;
- (NSArray)containingNotebooks;
- (NSArray)experts;
- (NSArray)notebooks;
- (NSArray)notes;
- (NSArray)relatedContent;
- (NSArray)tags;
- (NSNumber)cacheExpires;
- (NSString)cacheKey;
- (NSString)debugInfo;
- (void)setCacheExpires:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setContainingNotebooks:(id)a3;
- (void)setDebugInfo:(id)a3;
- (void)setExperts:(id)a3;
- (void)setNotebooks:(id)a3;
- (void)setNotes:(id)a3;
- (void)setRelatedContent:(id)a3;
- (void)setTags:(id)a3;
@end

@implementation EDAMRelatedResult

+ (id)structFields
{
  v21[9] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1122;
  if (!structFields_structFields_1122)
  {
    v20 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v19 = +[FATField fieldWithIndex:1 type:15 optional:1 name:@"notes" valueField:v20];
    v21[0] = v19;
    v18 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v17 = +[FATField fieldWithIndex:2 type:15 optional:1 name:@"notebooks" valueField:v18];
    v21[1] = v17;
    v16 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v3 = +[FATField fieldWithIndex:3 type:15 optional:1 name:@"tags" valueField:v16];
    v21[2] = v3;
    v4 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v5 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"containingNotebooks" valueField:v4];
    v21[3] = v5;
    v6 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"debugInfo"];
    v21[4] = v6;
    v7 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v8 = +[FATField fieldWithIndex:6 type:15 optional:1 name:@"experts" valueField:v7];
    v21[5] = v8;
    v9 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v10 = +[FATField fieldWithIndex:7 type:15 optional:1 name:@"relatedContent" valueField:v9];
    v21[6] = v10;
    v11 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"cacheKey"];
    v21[7] = v11;
    v12 = +[FATField fieldWithIndex:9 type:8 optional:1 name:@"cacheExpires"];
    v21[8] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:9];
    v14 = (void *)structFields_structFields_1122;
    structFields_structFields_1122 = v13;

    v2 = (void *)structFields_structFields_1122;
  }
  return v2;
}

+ (id)structName
{
  return @"RelatedResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheExpires, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_relatedContent, 0);
  objc_storeStrong((id *)&self->_experts, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_containingNotebooks, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_notebooks, 0);
  objc_storeStrong((id *)&self->_notes, 0);
}

- (void)setCacheExpires:(id)a3
{
}

- (NSNumber)cacheExpires
{
  return self->_cacheExpires;
}

- (void)setCacheKey:(id)a3
{
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setRelatedContent:(id)a3
{
}

- (NSArray)relatedContent
{
  return self->_relatedContent;
}

- (void)setExperts:(id)a3
{
}

- (NSArray)experts
{
  return self->_experts;
}

- (void)setDebugInfo:(id)a3
{
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void)setContainingNotebooks:(id)a3
{
}

- (NSArray)containingNotebooks
{
  return self->_containingNotebooks;
}

- (void)setTags:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setNotebooks:(id)a3
{
}

- (NSArray)notebooks
{
  return self->_notebooks;
}

- (void)setNotes:(id)a3
{
}

- (NSArray)notes
{
  return self->_notes;
}

@end