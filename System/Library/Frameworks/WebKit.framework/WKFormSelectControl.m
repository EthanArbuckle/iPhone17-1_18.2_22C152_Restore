@interface WKFormSelectControl
- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3;
- (NSArray)menuItemTitles;
- (NSString)selectFormPopoverTitle;
- (WKFormSelectControl)initWithView:(id)a3;
- (id).cxx_construct;
- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5;
@end

@implementation WKFormSelectControl

- (WKFormSelectControl)initWithView:(id)a3
{
  if (*(_DWORD *)([a3 focusedElementInformation] + 212))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    while (1)
    {
      result = (WKFormSelectControl *)[a3 focusedElementInformation];
      if (v5 >= HIDWORD(result[5].super._control.m_ptr)) {
        break;
      }
      BOOL v8 = *((unsigned char *)result[5].super.super.isa + v6) != 0;
      if (!*((unsigned char *)result[5].super.super.isa + v6))
      {
        ++v5;
        v6 += 16;
        if (v5 < *(unsigned int *)([a3 focusedElementInformation] + 212)) {
          continue;
        }
      }
      goto LABEL_8;
    }
    __break(0xC471u);
  }
  else
  {
    BOOL v8 = 0;
LABEL_8:
    CFTypeRef cf = 0;
    v9 = (PAL *)[a3 _shouldUseContextMenusForFormControls];
    if (v9)
    {
      uint64_t v10 = [a3 focusedElementInformation];
      v11 = off_1E580FE68;
      if (*(unsigned char *)(v10 + 178)) {
        v11 = off_1E580FE60;
      }
      CFTypeRef cf = (CFTypeRef)[objc_alloc(*v11) initWithView:a3];
      v18 = self;
      v12 = (objc_super *)&v18;
    }
    else
    {
      if (PAL::currentUserInterfaceIdiomIsSmallScreen(v9))
      {
        if (*(unsigned char *)([a3 focusedElementInformation] + 178) == 0 && ~v8) {
          v13 = WKSelectSinglePicker;
        }
        else {
          v13 = WKMultipleSelectPicker;
        }
        v14 = (WKSelectPopover *)[[v13 alloc] initWithView:a3];
      }
      else
      {
        v14 = [[WKSelectPopover alloc] initWithView:a3 hasGroups:v8];
      }
      CFTypeRef cf = v14;
      v17.receiver = self;
      v12 = &v17;
    }
    v12->super_class = (Class)WKFormSelectControl;
    v15 = [(objc_super *)v12 initWithView:a3 control:&cf];
    CFTypeRef v16 = cf;
    CFTypeRef cf = 0;
    if (v16) {
      CFRelease(v16);
    }
    return v15;
  }
  return result;
}

- (void).cxx_destruct
{
  m_ptr = self->_control.m_ptr;
  self->_control.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  BOOL v5 = a5;
  [(WKFormPeripheralBase *)self control];
  if (objc_opt_respondsToSelector())
  {
    v9 = [(WKFormPeripheralBase *)self control];
    [(WKFormControl *)v9 selectRow:a3 inComponent:a4 extendingSelection:v5];
  }
}

- (NSString)selectFormPopoverTitle
{
  [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v3 = (void *)[(WKFormControl *)[(WKFormPeripheralBase *)self control] tableViewController];

  return (NSString *)[v3 title];
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  [(WKFormPeripheralBase *)self control];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(WKFormPeripheralBase *)self control];

  return [(WKFormControl *)v5 selectFormAccessoryHasCheckedItemAtRow:a3];
}

- (NSArray)menuItemTitles
{
  [(WKFormPeripheralBase *)self control];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v3 = [(WKFormPeripheralBase *)self control];

  return (NSArray *)[(WKFormControl *)v3 menuItemTitles];
}

@end