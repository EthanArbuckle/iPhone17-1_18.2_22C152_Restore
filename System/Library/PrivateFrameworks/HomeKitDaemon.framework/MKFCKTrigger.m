@interface MKFCKTrigger
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
@end

@implementation MKFCKTrigger

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
    id v11 = v8;
    id v12 = v7;
    v13 = [v12 entity];
    v14 = [v13 relationshipsByName];
    v15 = [v14 objectForKeyedSubscript:@"actionSets_"];

    v16 = [(MKFCKModel *)self relationshipForLocalName:@"actionSets_" localModel:v12];
    -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:cloudRelationship:context:](self, v12, v15, v16, v11);
  }
  return v10;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:v8];
  if (self) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = v8;
    id v12 = v7;
    v13 = [v12 entity];
    v14 = [v13 relationshipsByName];
    v15 = [v14 objectForKeyedSubscript:@"actionSets_"];

    v16 = [(MKFCKModel *)self relationshipForLocalName:@"actionSets_" localModel:v12];
    -[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:cloudRelationship:context:](self, v12, v15, v16, v11);
  }
  return v10;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKTrigger"];
}

@end