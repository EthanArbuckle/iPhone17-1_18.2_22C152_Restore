@interface EDAMResourceAttributes
+ (id)structFields;
+ (id)structName;
- (EDAMLazyMap)applicationData;
- (NSNumber)altitude;
- (NSNumber)attachment;
- (NSNumber)clientWillIndex;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)timestamp;
- (NSString)cameraMake;
- (NSString)cameraModel;
- (NSString)fileName;
- (NSString)recoType;
- (NSString)sourceURL;
- (void)setAltitude:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setCameraMake:(id)a3;
- (void)setCameraModel:(id)a3;
- (void)setClientWillIndex:(id)a3;
- (void)setFileName:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setRecoType:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation EDAMResourceAttributes

+ (id)structFields
{
  v18[12] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1339;
  if (!structFields_structFields_1339)
  {
    v17 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"sourceURL"];
    v18[0] = v17;
    v16 = +[FATField fieldWithIndex:2 type:10 optional:1 name:@"timestamp"];
    v18[1] = v16;
    v15 = +[FATField fieldWithIndex:3 type:4 optional:1 name:@"latitude"];
    v18[2] = v15;
    v3 = +[FATField fieldWithIndex:4 type:4 optional:1 name:@"longitude"];
    v18[3] = v3;
    v4 = +[FATField fieldWithIndex:5 type:4 optional:1 name:@"altitude"];
    v18[4] = v4;
    v5 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"cameraMake"];
    v18[5] = v5;
    v6 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"cameraModel"];
    v18[6] = v6;
    v7 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"clientWillIndex"];
    v18[7] = v7;
    v8 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"recoType"];
    v18[8] = v8;
    v9 = +[FATField fieldWithIndex:10 type:11 optional:1 name:@"fileName"];
    v18[9] = v9;
    v10 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"attachment"];
    v18[10] = v10;
    v11 = +[FATField fieldWithIndex:12 type:12 optional:1 name:@"applicationData" structClass:objc_opt_class()];
    v18[11] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:12];
    v13 = (void *)structFields_structFields_1339;
    structFields_structFields_1339 = v12;

    v2 = (void *)structFields_structFields_1339;
  }
  return v2;
}

+ (id)structName
{
  return @"ResourceAttributes";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_recoType, 0);
  objc_storeStrong((id *)&self->_clientWillIndex, 0);
  objc_storeStrong((id *)&self->_cameraModel, 0);
  objc_storeStrong((id *)&self->_cameraMake, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)setApplicationData:(id)a3
{
}

- (EDAMLazyMap)applicationData
{
  return self->_applicationData;
}

- (void)setAttachment:(id)a3
{
}

- (NSNumber)attachment
{
  return self->_attachment;
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setRecoType:(id)a3
{
}

- (NSString)recoType
{
  return self->_recoType;
}

- (void)setClientWillIndex:(id)a3
{
}

- (NSNumber)clientWillIndex
{
  return self->_clientWillIndex;
}

- (void)setCameraModel:(id)a3
{
}

- (NSString)cameraModel
{
  return self->_cameraModel;
}

- (void)setCameraMake:(id)a3
{
}

- (NSString)cameraMake
{
  return self->_cameraMake;
}

- (void)setAltitude:(id)a3
{
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setSourceURL:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

@end