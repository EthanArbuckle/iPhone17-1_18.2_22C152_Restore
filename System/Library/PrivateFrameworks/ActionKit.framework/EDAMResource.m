@interface EDAMResource
+ (id)structFields;
+ (id)structName;
- (EDAMData)alternateData;
- (EDAMData)data;
- (EDAMData)recognition;
- (EDAMResourceAttributes)attributes;
- (NSNumber)active;
- (NSNumber)duration;
- (NSNumber)height;
- (NSNumber)updateSequenceNum;
- (NSNumber)width;
- (NSString)guid;
- (NSString)mime;
- (NSString)noteGuid;
- (void)setActive:(id)a3;
- (void)setAlternateData:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setData:(id)a3;
- (void)setDuration:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHeight:(id)a3;
- (void)setMime:(id)a3;
- (void)setNoteGuid:(id)a3;
- (void)setRecognition:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation EDAMResource

+ (id)structFields
{
  v18[12] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1446;
  if (!structFields_structFields_1446)
  {
    v17 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v18[0] = v17;
    v16 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"noteGuid"];
    v18[1] = v16;
    v3 = +[FATField fieldWithIndex:3 type:12 optional:1 name:@"data" structClass:objc_opt_class()];
    v18[2] = v3;
    v4 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"mime"];
    v18[3] = v4;
    v5 = +[FATField fieldWithIndex:5 type:6 optional:1 name:@"width"];
    v18[4] = v5;
    v6 = +[FATField fieldWithIndex:6 type:6 optional:1 name:@"height"];
    v18[5] = v6;
    v7 = +[FATField fieldWithIndex:7 type:6 optional:1 name:@"duration"];
    v18[6] = v7;
    v8 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"active"];
    v18[7] = v8;
    v9 = +[FATField fieldWithIndex:9 type:12 optional:1 name:@"recognition" structClass:objc_opt_class()];
    v18[8] = v9;
    v10 = +[FATField fieldWithIndex:11 type:12 optional:1 name:@"attributes" structClass:objc_opt_class()];
    v18[9] = v10;
    v11 = +[FATField fieldWithIndex:12 type:8 optional:1 name:@"updateSequenceNum"];
    v18[10] = v11;
    v12 = +[FATField fieldWithIndex:13 type:12 optional:1 name:@"alternateData" structClass:objc_opt_class()];
    v18[11] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:12];
    v14 = (void *)structFields_structFields_1446;
    structFields_structFields_1446 = v13;

    v2 = (void *)structFields_structFields_1446;
  }
  return v2;
}

+ (id)structName
{
  return @"Resource";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateData, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_mime, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setAlternateData:(id)a3
{
}

- (EDAMData)alternateData
{
  return self->_alternateData;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setAttributes:(id)a3
{
}

- (EDAMResourceAttributes)attributes
{
  return self->_attributes;
}

- (void)setRecognition:(id)a3
{
}

- (EDAMData)recognition
{
  return self->_recognition;
}

- (void)setActive:(id)a3
{
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setHeight:(id)a3
{
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setWidth:(id)a3
{
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setMime:(id)a3
{
}

- (NSString)mime
{
  return self->_mime;
}

- (void)setData:(id)a3
{
}

- (EDAMData)data
{
  return self->_data;
}

- (void)setNoteGuid:(id)a3
{
}

- (NSString)noteGuid
{
  return self->_noteGuid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

@end