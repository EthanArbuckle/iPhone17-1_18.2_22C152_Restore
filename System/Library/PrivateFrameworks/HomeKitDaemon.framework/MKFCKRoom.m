@interface MKFCKRoom
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
@end

@implementation MKFCKRoom

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [(MKFCKModel *)self copyPropertiesFromLocalModel:v7 context:v8];
  if (self) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    v11 = [(MKFCKRoom *)self homeZone];

    if (v11) {
      [(MKFCKRoom *)self setHomeZone:0];
    }
    v12 = +[_MKFApplicationData appDataDictionaryForContainer:v7];
    v13 = [(MKFCKRoom *)self applicationData];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0) {
      [(MKFCKRoom *)self setApplicationData:v12];
    }
  }
  return v10;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  BOOL v8 = [(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:a5];
  if (v8)
  {
    BOOL v9 = [(MKFCKRoom *)self applicationData];
    +[_MKFApplicationData setAppDataDictionary:v9 forContainer:v7];
  }
  return v8;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKRoom"];
}

@end