@interface CSLPRFStingSettingsModelWorkoutItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingSettingsModelWorkoutItem)initWithCoder:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (NSString)workoutIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWorkoutIdentifier:(id)a3;
@end

@implementation CSLPRFStingSettingsModelWorkoutItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setWorkoutIdentifier:(id)a3
{
}

- (NSString)workoutIdentifier
{
  return self->_workoutIdentifier;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_title withName:@"title" skipIfEmpty:1];
  [v3 appendString:self->_subtitle withName:@"subtitle" skipIfEmpty:1];
  [v3 appendString:self->_workoutIdentifier withName:@"workoutIdentifier" skipIfEmpty:1];
  v4 = [v3 build];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  title = self->_title;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__CSLPRFStingSettingsModelWorkoutItem_isEqual___block_invoke;
  v20[3] = &unk_264A0B520;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:title counterpart:v20];
  subtitle = self->_subtitle;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__CSLPRFStingSettingsModelWorkoutItem_isEqual___block_invoke_2;
  v18[3] = &unk_264A0B520;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendString:subtitle counterpart:v18];
  workoutIdentifier = self->_workoutIdentifier;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__CSLPRFStingSettingsModelWorkoutItem_isEqual___block_invoke_3;
  v16[3] = &unk_264A0B520;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendString:workoutIdentifier counterpart:v16];
  LOBYTE(workoutIdentifier) = [v5 isEqual];

  return (char)workoutIdentifier;
}

uint64_t __47__CSLPRFStingSettingsModelWorkoutItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) title];
}

uint64_t __47__CSLPRFStingSettingsModelWorkoutItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) subtitle];
}

uint64_t __47__CSLPRFStingSettingsModelWorkoutItem_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutIdentifier];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_title];
  id v5 = (id)[v3 appendString:self->_subtitle];
  id v6 = (id)[v3 appendString:self->_workoutIdentifier];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSLPRFStingSettingsModelWorkoutItem);
  id v5 = (void *)[(NSString *)self->_title copy];
  [(CSLPRFStingSettingsModelWorkoutItem *)v4 setTitle:v5];

  id v6 = (void *)[(NSString *)self->_subtitle copy];
  [(CSLPRFStingSettingsModelWorkoutItem *)v4 setSubtitle:v6];

  unint64_t v7 = (void *)[(NSString *)self->_workoutIdentifier copy];
  [(CSLPRFStingSettingsModelWorkoutItem *)v4 setWorkoutIdentifier:v7];

  return v4;
}

- (CSLPRFStingSettingsModelWorkoutItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFStingSettingsModelWorkoutItem;
  id v5 = [(CSLPRFStingSettingsModelWorkoutItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"workoutIdentifier"];
    workoutIdentifier = v5->_workoutIdentifier;
    v5->_workoutIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_workoutIdentifier forKey:@"workoutIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end