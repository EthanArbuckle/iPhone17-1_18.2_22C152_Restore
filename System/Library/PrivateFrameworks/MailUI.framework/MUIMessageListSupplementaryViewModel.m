@interface MUIMessageListSupplementaryViewModel
+ (id)_publicDescriptionOfDisplayReason:(int64_t)a3;
+ (id)supplementaryViewModelWithDisplay:(BOOL)a3 kind:(id)a4 sectionIndex:(int64_t)a5 reason:(int64_t)a6;
- (BOOL)shouldDisplaySupplementaryView;
- (NSString)ef_publicDescription;
- (NSString)supplementaryKind;
- (id)initShouldDisplaySupplementaryView:(BOOL)a3 ofKind:(id)a4 atSectionWithIndex:(int64_t)a5 withDisplayReason:(int64_t)a6;
- (int64_t)displayReason;
- (int64_t)sectionIndex;
- (void)setDisplayReason:(int64_t)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setShouldDisplaySupplementaryView:(BOOL)a3;
- (void)setSupplementaryKind:(id)a3;
@end

@implementation MUIMessageListSupplementaryViewModel

- (void).cxx_destruct
{
}

- (BOOL)shouldDisplaySupplementaryView
{
  return self->_shouldDisplaySupplementaryView;
}

+ (id)supplementaryViewModelWithDisplay:(BOOL)a3 kind:(id)a4 sectionIndex:(int64_t)a5 reason:(int64_t)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = [[MUIMessageListSupplementaryViewModel alloc] initShouldDisplaySupplementaryView:v8 ofKind:v9 atSectionWithIndex:a5 withDisplayReason:a6];

  return v10;
}

- (id)initShouldDisplaySupplementaryView:(BOOL)a3 ofKind:(id)a4 atSectionWithIndex:(int64_t)a5 withDisplayReason:(int64_t)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MUIMessageListSupplementaryViewModel;
  v11 = [(MUIMessageListSupplementaryViewModel *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_shouldDisplaySupplementaryView = a3;
    uint64_t v13 = [v10 copy];
    supplementaryKind = v12->_supplementaryKind;
    v12->_supplementaryKind = (NSString *)v13;

    v12->_sectionIndex = a5;
    v12->_displayReason = a6;
  }

  return v12;
}

+ (id)_publicDescriptionOfDisplayReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Section isn't visible";
  }
  else {
    return off_1E6D131E0[a3 - 1];
  }
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MUIMessageListSupplementaryViewModel *)self shouldDisplaySupplementaryView];
  v6 = [(MUIMessageListSupplementaryViewModel *)self supplementaryKind];
  int64_t v7 = [(MUIMessageListSupplementaryViewModel *)self sectionIndex];
  BOOL v8 = +[MUIMessageListSupplementaryViewModel _publicDescriptionOfDisplayReason:[(MUIMessageListSupplementaryViewModel *)self displayReason]];
  id v9 = [v3 stringWithFormat:@"<%@: %p>\n\tshouldDisplayHeader: %d\n\tsupplementaryKind: %@\n\tsectionIndex: %ld\n\tdisplayReason: %@", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (void)setShouldDisplaySupplementaryView:(BOOL)a3
{
  self->_shouldDisplaySupplementaryView = a3;
}

- (NSString)supplementaryKind
{
  return self->_supplementaryKind;
}

- (void)setSupplementaryKind:(id)a3
{
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (int64_t)displayReason
{
  return self->_displayReason;
}

- (void)setDisplayReason:(int64_t)a3
{
  self->_displayReason = a3;
}

@end