@interface EDAMNoteResultSpec
+ (id)structFields;
+ (id)structName;
- (NSNumber)includeAccountLimits;
- (NSNumber)includeContent;
- (NSNumber)includeNoteAppDataValues;
- (NSNumber)includeResourceAppDataValues;
- (NSNumber)includeResourcesAlternateData;
- (NSNumber)includeResourcesData;
- (NSNumber)includeResourcesRecognition;
- (NSNumber)includeSharedNotes;
- (void)setIncludeAccountLimits:(id)a3;
- (void)setIncludeContent:(id)a3;
- (void)setIncludeNoteAppDataValues:(id)a3;
- (void)setIncludeResourceAppDataValues:(id)a3;
- (void)setIncludeResourcesAlternateData:(id)a3;
- (void)setIncludeResourcesData:(id)a3;
- (void)setIncludeResourcesRecognition:(id)a3;
- (void)setIncludeSharedNotes:(id)a3;
@end

@implementation EDAMNoteResultSpec

+ (id)structFields
{
  v14[8] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_823;
  if (!structFields_structFields_823)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"includeContent"];
    v14[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"includeResourcesData"];
    v14[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"includeResourcesRecognition"];
    v14[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"includeResourcesAlternateData"];
    v14[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"includeSharedNotes"];
    v14[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"includeNoteAppDataValues"];
    v14[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"includeResourceAppDataValues"];
    v14[6] = v9;
    v10 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"includeAccountLimits"];
    v14[7] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:8];
    v12 = (void *)structFields_structFields_823;
    structFields_structFields_823 = v11;

    v2 = (void *)structFields_structFields_823;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteResultSpec";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeAccountLimits, 0);
  objc_storeStrong((id *)&self->_includeResourceAppDataValues, 0);
  objc_storeStrong((id *)&self->_includeNoteAppDataValues, 0);
  objc_storeStrong((id *)&self->_includeSharedNotes, 0);
  objc_storeStrong((id *)&self->_includeResourcesAlternateData, 0);
  objc_storeStrong((id *)&self->_includeResourcesRecognition, 0);
  objc_storeStrong((id *)&self->_includeResourcesData, 0);
  objc_storeStrong((id *)&self->_includeContent, 0);
}

- (void)setIncludeAccountLimits:(id)a3
{
}

- (NSNumber)includeAccountLimits
{
  return self->_includeAccountLimits;
}

- (void)setIncludeResourceAppDataValues:(id)a3
{
}

- (NSNumber)includeResourceAppDataValues
{
  return self->_includeResourceAppDataValues;
}

- (void)setIncludeNoteAppDataValues:(id)a3
{
}

- (NSNumber)includeNoteAppDataValues
{
  return self->_includeNoteAppDataValues;
}

- (void)setIncludeSharedNotes:(id)a3
{
}

- (NSNumber)includeSharedNotes
{
  return self->_includeSharedNotes;
}

- (void)setIncludeResourcesAlternateData:(id)a3
{
}

- (NSNumber)includeResourcesAlternateData
{
  return self->_includeResourcesAlternateData;
}

- (void)setIncludeResourcesRecognition:(id)a3
{
}

- (NSNumber)includeResourcesRecognition
{
  return self->_includeResourcesRecognition;
}

- (void)setIncludeResourcesData:(id)a3
{
}

- (NSNumber)includeResourcesData
{
  return self->_includeResourcesData;
}

- (void)setIncludeContent:(id)a3
{
}

- (NSNumber)includeContent
{
  return self->_includeContent;
}

@end