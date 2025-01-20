@interface _LTTranslationSense
+ (BOOL)supportsSecureCoding;
+ (id)senseFromDictionary:(id)a3;
+ (id)senseWithPhrasebookMatchMeta:(id)a3;
+ (id)sensesFromArray:(id)a3;
- (BOOL)isPhrasebookMatch;
- (NSArray)labels;
- (NSString)definition;
- (NSString)senseID;
- (NSString)sourceMatch;
- (NSString)targetMatch;
- (_LTTranslationSense)initWithCoder:(id)a3;
- (id)jsonRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDefinition:(id)a3;
- (void)setLabels:(id)a3;
- (void)setPhrasebookMatch:(BOOL)a3;
- (void)setSenseID:(id)a3;
- (void)setSourceMatch:(id)a3;
- (void)setTargetMatch:(id)a3;
@end

@implementation _LTTranslationSense

- (id)jsonRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(_LTTranslationSense *)self senseID];

  if (v4)
  {
    v5 = [(_LTTranslationSense *)self senseID];
    [v3 setObject:v5 forKeyedSubscript:@"syn"];
  }
  v6 = [(_LTTranslationSense *)self definition];

  if (v6)
  {
    v7 = [(_LTTranslationSense *)self definition];
    [v3 setObject:v7 forKeyedSubscript:@"def"];
  }
  v8 = [(_LTTranslationSense *)self sourceMatch];

  if (v8)
  {
    v9 = [(_LTTranslationSense *)self sourceMatch];
    [v3 setObject:v9 forKeyedSubscript:@"sourceMatch"];
  }
  v10 = [(_LTTranslationSense *)self targetMatch];

  if (v10)
  {
    v11 = [(_LTTranslationSense *)self targetMatch];
    [v3 setObject:v11 forKeyedSubscript:@"targetMatch"];
  }

  return v3;
}

+ (id)sensesFromArray:(id)a3
{
  return (id)[a3 _ltCompactMap:&__block_literal_global_12];
}

+ (id)senseWithPhrasebookMatchMeta:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = +[_LTTranslationSense senseFromDictionary:a3];
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)senseFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"syn"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"sense ID"];
  }
  v7 = v6;

  v8 = [v3 objectForKeyedSubscript:@"def"];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v3 objectForKeyedSubscript:@"definition"];
  }
  v11 = v10;

  v12 = 0;
  if (v7 && v11)
  {
    v12 = objc_alloc_init(_LTTranslationSense);
    [(_LTTranslationSense *)v12 setSenseID:v7];
    [(_LTTranslationSense *)v12 setDefinition:v11];
    v13 = [v3 objectForKeyedSubscript:@"status"];
    -[_LTTranslationSense setPhrasebookMatch:](v12, "setPhrasebookMatch:", [v13 isEqualToString:@"phrasebook_exact"]);

    BOOL v14 = [(_LTTranslationSense *)v12 isPhrasebookMatch];
    if (v14) {
      v15 = @"input";
    }
    else {
      v15 = @"source match";
    }
    if (v14) {
      v16 = @"output";
    }
    else {
      v16 = @"target match";
    }
    v17 = [v3 objectForKeyedSubscript:v15];
    [(_LTTranslationSense *)v12 setSourceMatch:v17];

    v18 = [v3 objectForKeyedSubscript:v16];
    [(_LTTranslationSense *)v12 setTargetMatch:v18];

    v19 = [MEMORY[0x263EFF980] array];
    v20 = [v3 objectForKeyedSubscript:@"gender"];

    if (v20)
    {
      v21 = [v3 objectForKeyedSubscript:@"gender"];
      [v19 addObject:v21];
    }
    v22 = [v3 objectForKeyedSubscript:@"formality"];

    if (v22)
    {
      v23 = [v3 objectForKeyedSubscript:@"formality"];
      [v19 addObject:v23];
    }
    v24 = [v3 objectForKeyedSubscript:@"pos"];

    if (v24)
    {
      v25 = [v3 objectForKeyedSubscript:@"pos"];
      [v19 addObject:v25];
    }
    [(_LTTranslationSense *)v12 setLabels:v19];
  }

  return v12;
}

- (_LTTranslationSense)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_LTTranslationSense;
  v5 = [(_LTTranslationSense *)&v22 init];
  if (v5)
  {
    v5->_phrasebookMatch = [v4 decodeBoolForKey:@"pbMatch"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syn"];
    senseID = v5->_senseID;
    v5->_senseID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"def"];
    definition = v5->_definition;
    v5->_definition = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceMatch"];
    sourceMatch = v5->_sourceMatch;
    v5->_sourceMatch = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetMatch"];
    targetMatch = v5->_targetMatch;
    v5->_targetMatch = (NSString *)v12;

    BOOL v14 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v16 = [v14 setWithArray:v15];

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"labels"];
    v18 = (void *)v17;
    if (v17) {
      v19 = (void *)v17;
    }
    else {
      v19 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v5->_labels, v19);

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL phrasebookMatch = self->_phrasebookMatch;
  id v5 = a3;
  [v5 encodeBool:phrasebookMatch forKey:@"pbMatch"];
  [v5 encodeObject:self->_senseID forKey:@"syn"];
  [v5 encodeObject:self->_definition forKey:@"def"];
  [v5 encodeObject:self->_sourceMatch forKey:@"sourceMatch"];
  [v5 encodeObject:self->_targetMatch forKey:@"targetMatch"];
  [v5 encodeObject:self->_labels forKey:@"labels"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPhrasebookMatch
{
  return self->_phrasebookMatch;
}

- (void)setPhrasebookMatch:(BOOL)a3
{
  self->_BOOL phrasebookMatch = a3;
}

- (NSString)senseID
{
  return self->_senseID;
}

- (void)setSenseID:(id)a3
{
}

- (NSString)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
}

- (NSString)sourceMatch
{
  return self->_sourceMatch;
}

- (void)setSourceMatch:(id)a3
{
}

- (NSString)targetMatch
{
  return self->_targetMatch;
}

- (void)setTargetMatch:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_targetMatch, 0);
  objc_storeStrong((id *)&self->_sourceMatch, 0);
  objc_storeStrong((id *)&self->_definition, 0);

  objc_storeStrong((id *)&self->_senseID, 0);
}

@end