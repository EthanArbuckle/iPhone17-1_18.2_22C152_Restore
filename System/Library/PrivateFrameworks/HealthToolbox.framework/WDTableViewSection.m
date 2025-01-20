@interface WDTableViewSection
- (WDTableViewSection)initWithDelegate:(id)a3 atSection:(unint64_t)a4;
- (WDTableViewSectionDelegate)delegate;
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

@implementation WDTableViewSection

- (WDTableViewSection)initWithDelegate:(id)a3 atSection:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDTableViewSection;
  v7 = [(WDTableViewSection *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_section = a4;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = v8;
  }

  return v8;
}

- (void)reloadAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSection:self->_section animated:v3];
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
  return *MEMORY[0x263F46380];
}

- (double)heightForRow:(unint64_t)a3
{
  return *MEMORY[0x263F1D600];
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

- (WDTableViewSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WDTableViewSectionDelegate *)WeakRetained;
}

- (unint64_t)section
{
  return self->_section;
}

- (void).cxx_destruct
{
}

@end