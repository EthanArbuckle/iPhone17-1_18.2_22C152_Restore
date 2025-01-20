@interface ASTInstructionalPrompt
+ (BOOL)supportsSecureCoding;
- (ASTInstructionalPrompt)initWithCoder:(id)a3;
- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 iconLocator:(id)a5 localizedTitle:(id)a6 localizedSubtitle:(id)a7 imageLocators:(id)a8 instructions:(id)a9 instructionsStyle:(int64_t)a10 options:(id)a11;
- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 iconLocator:(id)a5 localizedTitle:(id)a6 localizedSubtitle:(id)a7 imageLocators:(id)a8 instructions:(id)a9 options:(id)a10;
- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 imageLocators:(id)a5 instructions:(id)a6 options:(id)a7;
- (NSArray)imageLocators;
- (NSArray)instructions;
- (NSArray)options;
- (NSNumber)identifier;
- (NSString)iconLocator;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (int64_t)instructionsStyle;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIconLocator:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageLocators:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setInstructionsStyle:(int64_t)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setOptions:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ASTInstructionalPrompt

- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 imageLocators:(id)a5 instructions:(id)a6 options:(id)a7
{
  return [(ASTInstructionalPrompt *)self initWithID:a3 type:a4 iconLocator:0 localizedTitle:0 localizedSubtitle:0 imageLocators:a5 instructions:a6 instructionsStyle:0 options:a7];
}

- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 iconLocator:(id)a5 localizedTitle:(id)a6 localizedSubtitle:(id)a7 imageLocators:(id)a8 instructions:(id)a9 options:(id)a10
{
  return [(ASTInstructionalPrompt *)self initWithID:a3 type:a4 iconLocator:a5 localizedTitle:a6 localizedSubtitle:a7 imageLocators:a8 instructions:a9 instructionsStyle:0 options:a10];
}

- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 iconLocator:(id)a5 localizedTitle:(id)a6 localizedSubtitle:(id)a7 imageLocators:(id)a8 instructions:(id)a9 instructionsStyle:(int64_t)a10 options:(id)a11
{
  id v17 = a3;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v18 = a11;
  v28.receiver = self;
  v28.super_class = (Class)ASTInstructionalPrompt;
  v19 = [(ASTInstructionalPrompt *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v20->_type = a4;
    objc_storeStrong((id *)&v20->_iconLocator, a5);
    objc_storeStrong((id *)&v20->_localizedTitle, a6);
    objc_storeStrong((id *)&v20->_localizedSubtitle, a7);
    objc_storeStrong((id *)&v20->_imageLocators, a8);
    objc_storeStrong((id *)&v20->_instructions, a9);
    v20->_instructionsStyle = a10;
    objc_storeStrong((id *)&v20->_options, a11);
  }

  return v20;
}

- (ASTInstructionalPrompt)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTInstructionalPrompt *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v6;

    v5->_type = (int)[v4 decodeIntForKey:@"type"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconLocator"];
    iconLocator = v5->_iconLocator;
    v5->_iconLocator = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"imageLocators"];
    imageLocators = v5->_imageLocators;
    v5->_imageLocators = (NSArray *)v17;

    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"instructions"];
    instructions = v5->_instructions;
    v5->_instructions = (NSArray *)v22;

    v5->_instructionsStyle = (int)[v4 decodeIntForKey:@"instructionsStyle"];
    id v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    id v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"options"];
    options = v5->_options;
    v5->_options = (NSArray *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTInstructionalPrompt *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInt:forKey:", -[ASTInstructionalPrompt type](self, "type"), @"type");
  uint64_t v6 = [(ASTInstructionalPrompt *)self iconLocator];
  [v4 encodeObject:v6 forKey:@"iconLocator"];

  v7 = [(ASTInstructionalPrompt *)self localizedTitle];
  [v4 encodeObject:v7 forKey:@"localizedTitle"];

  uint64_t v8 = [(ASTInstructionalPrompt *)self localizedSubtitle];
  [v4 encodeObject:v8 forKey:@"localizedSubtitle"];

  v9 = [(ASTInstructionalPrompt *)self imageLocators];
  [v4 encodeObject:v9 forKey:@"imageLocators"];

  uint64_t v10 = [(ASTInstructionalPrompt *)self instructions];
  [v4 encodeObject:v10 forKey:@"instructions"];

  objc_msgSend(v4, "encodeInt:forKey:", -[ASTInstructionalPrompt instructionsStyle](self, "instructionsStyle"), @"instructionsStyle");
  id v11 = [(ASTInstructionalPrompt *)self options];
  [v4 encodeObject:v11 forKey:@"options"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)iconLocator
{
  return self->_iconLocator;
}

- (void)setIconLocator:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSArray)imageLocators
{
  return self->_imageLocators;
}

- (void)setImageLocators:(id)a3
{
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (int64_t)instructionsStyle
{
  return self->_instructionsStyle;
}

- (void)setInstructionsStyle:(int64_t)a3
{
  self->_instructionsStyle = a3;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_imageLocators, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_iconLocator, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end