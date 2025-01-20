@interface EDAMRelatedResultSpec
+ (id)structFields;
+ (id)structName;
- (NSNumber)includeContainingNotebooks;
- (NSNumber)includeDebugInfo;
- (NSNumber)maxExperts;
- (NSNumber)maxNotebooks;
- (NSNumber)maxNotes;
- (NSNumber)maxRelatedContent;
- (NSNumber)maxTags;
- (NSNumber)writableNotebooksOnly;
- (NSSet)relatedContentTypes;
- (void)setIncludeContainingNotebooks:(id)a3;
- (void)setIncludeDebugInfo:(id)a3;
- (void)setMaxExperts:(id)a3;
- (void)setMaxNotebooks:(id)a3;
- (void)setMaxNotes:(id)a3;
- (void)setMaxRelatedContent:(id)a3;
- (void)setMaxTags:(id)a3;
- (void)setRelatedContentTypes:(id)a3;
- (void)setWritableNotebooksOnly:(id)a3;
@end

@implementation EDAMRelatedResultSpec

+ (id)structFields
{
  v16[9] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1174;
  if (!structFields_structFields_1174)
  {
    v15 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"maxNotes"];
    v16[0] = v15;
    v3 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"maxNotebooks"];
    v16[1] = v3;
    v4 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"maxTags"];
    v16[2] = v4;
    v5 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"writableNotebooksOnly"];
    v16[3] = v5;
    v6 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"includeContainingNotebooks"];
    v16[4] = v6;
    v7 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"includeDebugInfo"];
    v16[5] = v7;
    v8 = +[FATField fieldWithIndex:7 type:8 optional:1 name:@"maxExperts"];
    v16[6] = v8;
    v9 = +[FATField fieldWithIndex:8 type:8 optional:1 name:@"maxRelatedContent"];
    v16[7] = v9;
    v10 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v11 = +[FATField fieldWithIndex:9 type:14 optional:1 name:@"relatedContentTypes" valueField:v10];
    v16[8] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:9];
    v13 = (void *)structFields_structFields_1174;
    structFields_structFields_1174 = v12;

    v2 = (void *)structFields_structFields_1174;
  }
  return v2;
}

+ (id)structName
{
  return @"RelatedResultSpec";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedContentTypes, 0);
  objc_storeStrong((id *)&self->_maxRelatedContent, 0);
  objc_storeStrong((id *)&self->_maxExperts, 0);
  objc_storeStrong((id *)&self->_includeDebugInfo, 0);
  objc_storeStrong((id *)&self->_includeContainingNotebooks, 0);
  objc_storeStrong((id *)&self->_writableNotebooksOnly, 0);
  objc_storeStrong((id *)&self->_maxTags, 0);
  objc_storeStrong((id *)&self->_maxNotebooks, 0);
  objc_storeStrong((id *)&self->_maxNotes, 0);
}

- (void)setRelatedContentTypes:(id)a3
{
}

- (NSSet)relatedContentTypes
{
  return self->_relatedContentTypes;
}

- (void)setMaxRelatedContent:(id)a3
{
}

- (NSNumber)maxRelatedContent
{
  return self->_maxRelatedContent;
}

- (void)setMaxExperts:(id)a3
{
}

- (NSNumber)maxExperts
{
  return self->_maxExperts;
}

- (void)setIncludeDebugInfo:(id)a3
{
}

- (NSNumber)includeDebugInfo
{
  return self->_includeDebugInfo;
}

- (void)setIncludeContainingNotebooks:(id)a3
{
}

- (NSNumber)includeContainingNotebooks
{
  return self->_includeContainingNotebooks;
}

- (void)setWritableNotebooksOnly:(id)a3
{
}

- (NSNumber)writableNotebooksOnly
{
  return self->_writableNotebooksOnly;
}

- (void)setMaxTags:(id)a3
{
}

- (NSNumber)maxTags
{
  return self->_maxTags;
}

- (void)setMaxNotebooks:(id)a3
{
}

- (NSNumber)maxNotebooks
{
  return self->_maxNotebooks;
}

- (void)setMaxNotes:(id)a3
{
}

- (NSNumber)maxNotes
{
  return self->_maxNotes;
}

@end