@interface FBARDVSection
- (FBARDVSection)initWithTitle:(id)a3 type:(unint64_t)a4;
- (NSMutableArray)rows;
- (NSString)sectionTitle;
- (unint64_t)sectionType;
- (void)setRows:(id)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSectionType:(unint64_t)a3;
@end

@implementation FBARDVSection

- (FBARDVSection)initWithTitle:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBARDVSection;
  v8 = [(FBARDVSection *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    rows = v8->_rows;
    v8->_rows = v9;

    objc_storeStrong((id *)&v8->_sectionTitle, a3);
    v8->_sectionType = a4;
  }

  return v8;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);

  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end