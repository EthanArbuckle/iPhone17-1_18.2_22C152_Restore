@interface FBKModalConfiguration
+ (id)entityName;
+ (id)fetchRequest;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKModalConfiguration

+ (id)fetchRequest
{
  v2 = (void *)MEMORY[0x263EFF260];
  v3 = [a1 entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  return v4;
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v23 = a3;
  v4 = [v23 objectForKeyedSubscript:@"type_enum"];
  v5 = FBKNilIfNSNull(v4);

  if (v5)
  {
    uint64_t v6 = [v5 unsignedIntegerValue];
    if ((unint64_t)(v6 - 1) >= 3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    [(FBKModalConfiguration *)self setTypeEnum:v7];
  }
  v8 = [v23 objectForKeyedSubscript:@"sort_order"];
  v9 = FBKNilIfNSNull(v8);

  if (v9) {
    -[FBKModalConfiguration setSortOrder:](self, "setSortOrder:", [v9 unsignedIntegerValue]);
  }
  v10 = [v23 objectForKeyedSubscript:@"icon_name"];
  v11 = FBKNilIfNSNull(v10);

  if (v11) {
    [(FBKModalConfiguration *)self setIconName:v11];
  }
  v12 = [v23 objectForKeyedSubscript:@"title"];
  v13 = FBKNilIfNSNull(v12);

  if (v13) {
    [(FBKModalConfiguration *)self setTitle:v13];
  }
  v14 = [v23 objectForKeyedSubscript:@"subtitle"];
  v15 = FBKNilIfNSNull(v14);

  if (v15) {
    [(FBKModalConfiguration *)self setSubtitle:v15];
  }
  v16 = [v23 objectForKeyedSubscript:@"body"];
  v17 = FBKNilIfNSNull(v16);

  if (v17) {
    [(FBKModalConfiguration *)self setBody:v17];
  }
  v18 = [v23 objectForKeyedSubscript:@"choice_set"];
  v19 = FBKNilIfNSNull(v18);

  v20 = [v19 objectForKeyedSubscript:@"choice_options"];
  v21 = FBKNilIfNSNull(v20);

  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = objc_msgSend(v21, "ded_mapWithBlock:", &__block_literal_global_23);
      [(FBKModalConfiguration *)self setChoices:v22];
    }
  }
}

id __53__FBKModalConfiguration_setPropertiesFromJSONObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FBKQuestionChoice choiceFromArray:a2];
}

+ (id)entityName
{
  return @"ModalConfiguration";
}

@end