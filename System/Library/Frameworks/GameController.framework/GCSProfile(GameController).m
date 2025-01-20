@interface GCSProfile(GameController)
- (id)directionPadMappingForPhysicalPress:()GameController;
- (id)elementMappingForPhysicalPress:()GameController;
- (id)logicalButtonForPhysicalPressOf:()GameController onPhysicalInputProfile:;
- (id)logicalDirectionPadForPhysicalPressOf:()GameController onPhysicalInputProfile:;
- (id)logicalElementForPhysicalPressOf:()GameController onPhysicalInputProfile:;
@end

@implementation GCSProfile(GameController)

- (id)logicalElementForPhysicalPressOf:()GameController onPhysicalInputProfile:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 elementMappings];
  v9 = [v7 primaryAlias];

  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [v6 elements];
    v12 = [v10 mappingKey];
    v13 = [v11 objectForKeyedSubscript:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)logicalButtonForPhysicalPressOf:()GameController onPhysicalInputProfile:
{
  v1 = objc_msgSend(a1, "logicalElementForPhysicalPressOf:onPhysicalInputProfile:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)logicalDirectionPadForPhysicalPressOf:()GameController onPhysicalInputProfile:
{
  v1 = objc_msgSend(a1, "logicalElementForPhysicalPressOf:onPhysicalInputProfile:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)elementMappingForPhysicalPress:()GameController
{
  id v4 = a3;
  v5 = [a1 elementMappings];
  id v6 = [v4 primaryAlias];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)directionPadMappingForPhysicalPress:()GameController
{
  id v4 = a3;
  v5 = [a1 elementMappings];
  id v6 = [v4 primaryAlias];

  id v7 = [v5 objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

@end