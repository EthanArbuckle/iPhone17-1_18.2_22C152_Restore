@interface EKUIContextMenuActionInfo
- (BOOL)showsInEditMenu;
- (EKUIContextMenuActionInfo)initWithAction:(unint64_t)a3 showsInEditMenu:(BOOL)a4 group:(unint64_t)a5 positionInGroup:(unint64_t)a6 shouldShowBlock:(id)a7 configureUIActionBlock:(id)a8 actionBlock:(id)a9;
- (id)actionBlock;
- (id)configureUIActionBlock;
- (id)initCalendarMenuPlaceholderInGroup:(unint64_t)a3 positionInGroup:(unint64_t)a4;
- (id)shouldShowBlock;
- (unint64_t)action;
- (unint64_t)group;
- (unint64_t)positionInGroup;
@end

@implementation EKUIContextMenuActionInfo

- (EKUIContextMenuActionInfo)initWithAction:(unint64_t)a3 showsInEditMenu:(BOOL)a4 group:(unint64_t)a5 positionInGroup:(unint64_t)a6 shouldShowBlock:(id)a7 configureUIActionBlock:(id)a8 actionBlock:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)EKUIContextMenuActionInfo;
  v18 = [(EKUIContextMenuActionInfo *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_showsInEditMenu = a4;
    v18->_action = a3;
    v18->_group = a5;
    v18->_positionInGroup = a6;
    v20 = _Block_copy(v15);
    id shouldShowBlock = v19->_shouldShowBlock;
    v19->_id shouldShowBlock = v20;

    v22 = _Block_copy(v16);
    id configureUIActionBlock = v19->_configureUIActionBlock;
    v19->_id configureUIActionBlock = v22;

    v24 = _Block_copy(v17);
    id actionBlock = v19->_actionBlock;
    v19->_id actionBlock = v24;
  }
  return v19;
}

- (id)initCalendarMenuPlaceholderInGroup:(unint64_t)a3 positionInGroup:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIContextMenuActionInfo;
  id result = [(EKUIContextMenuActionInfo *)&v7 init];
  if (result)
  {
    *((void *)result + 3) = 0x20000;
    *((void *)result + 4) = a3;
    *((void *)result + 5) = a4;
  }
  return result;
}

- (unint64_t)action
{
  return self->_action;
}

- (BOOL)showsInEditMenu
{
  return self->_showsInEditMenu;
}

- (unint64_t)group
{
  return self->_group;
}

- (unint64_t)positionInGroup
{
  return self->_positionInGroup;
}

- (id)shouldShowBlock
{
  return self->_shouldShowBlock;
}

- (id)configureUIActionBlock
{
  return self->_configureUIActionBlock;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong(&self->_configureUIActionBlock, 0);
  objc_storeStrong(&self->_shouldShowBlock, 0);

  objc_storeStrong(&self->_selectionStateBlock, 0);
}

@end