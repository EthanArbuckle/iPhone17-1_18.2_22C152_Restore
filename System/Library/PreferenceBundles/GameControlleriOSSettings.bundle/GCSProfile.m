@interface GCSProfile
- (GCSProfile)initWithName:(id)a3 sfSymbolsName:(id)a4 customizable:(BOOL)a5 uuid:(id)a6;
- (id)directionPadMappingForPhysicalPress:(id)a3;
- (id)elementMappingForPhysicalPress:(id)a3;
- (id)logicalButtonForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4;
- (id)logicalDirectionPadForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4;
- (id)logicalElementForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4;
@end

@implementation GCSProfile

- (id)logicalElementForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GCSProfile *)self elementMappings];
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

- (id)logicalButtonForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4
{
  v4 = [(GCSProfile *)self logicalElementForPhysicalPressOf:a3 onPhysicalInputProfile:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)logicalDirectionPadForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4
{
  v4 = [(GCSProfile *)self logicalElementForPhysicalPressOf:a3 onPhysicalInputProfile:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)elementMappingForPhysicalPress:(id)a3
{
  id v4 = a3;
  id v5 = [(GCSProfile *)self elementMappings];
  id v6 = [v4 primaryAlias];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)directionPadMappingForPhysicalPress:(id)a3
{
  id v4 = a3;
  id v5 = [(GCSProfile *)self elementMappings];
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

- (GCSProfile)initWithName:(id)a3 sfSymbolsName:(id)a4 customizable:(BOOL)a5 uuid:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = sub_10C7C(&qword_123560);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_E7110();
  uint64_t v13 = v12;
  uint64_t v14 = sub_E7110();
  uint64_t v16 = v15;
  if (a6)
  {
    sub_E6030();
    uint64_t v17 = sub_E6050();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_E6050();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  }
  return (GCSProfile *)sub_E09EC(v11, v13, v14, v16, v7, (uint64_t)v10);
}

@end