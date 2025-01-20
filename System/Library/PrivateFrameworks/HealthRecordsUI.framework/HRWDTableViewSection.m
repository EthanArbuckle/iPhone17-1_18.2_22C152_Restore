@interface HRWDTableViewSection
- (HRWDTableViewSection)initWithDelegate:(id)a3 atSection:(unint64_t)a4;
- (HRWDTableViewSectionDelegate)delegate;
- (double)estimatedHeightForRow:(unint64_t)a3;
- (double)heightForFooter;
- (double)heightForHeader;
- (double)heightForRow:(unint64_t)a3;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (id)titleForFooter;
- (id)titleForHeader;
- (id)viewForFooter:(id)a3;
- (id)viewForHeader:(id)a3;
- (id)willSelectRow:(id)a3;
- (unint64_t)numberOfRows;
- (unint64_t)section;
- (void)reloadAnimated:(BOOL)a3;
@end

@implementation HRWDTableViewSection

- (HRWDTableViewSection)initWithDelegate:(id)a3 atSection:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HRWDTableViewSection;
  v6 = [(HRWDTableViewSection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_delegate = (HRWDTableViewSectionDelegate *)a3;
    v6->_section = a4;
    v8 = v6;
  }

  return v7;
}

- (void)reloadAnimated:(BOOL)a3
{
}

- (id)viewForHeader:(id)a3
{
  return 0;
}

- (id)titleForHeader
{
  return 0;
}

- (id)viewForFooter:(id)a3
{
  return 0;
}

- (id)titleForFooter
{
  return 0;
}

- (unint64_t)numberOfRows
{
  return 0;
}

- (double)heightForHeader
{
  return 0.0;
}

- (double)heightForFooter
{
  return 0.0;
}

- (double)estimatedHeightForRow:(unint64_t)a3
{
  return *MEMORY[0x1E4F67958];
}

- (double)heightForRow:(unint64_t)a3
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  return 0;
}

- (id)willSelectRow:(id)a3
{
  id v3 = a3;
  return v3;
}

- (HRWDTableViewSectionDelegate)delegate
{
  return self->_delegate;
}

- (unint64_t)section
{
  return self->_section;
}

@end