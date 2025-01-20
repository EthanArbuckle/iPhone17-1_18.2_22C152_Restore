@interface _MKPlaceActionButtonController
+ (_MKPlaceActionButtonController)actionButtonControllerWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5;
+ (_MKPlaceActionButtonController)actionButtonControllerWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5 disabled:(BOOL)a6 symbolName:(id)a7;
- (BOOL)disabled;
- (NSString)buttonSubTitle;
- (NSString)buttonTitle;
- (NSString)symbolName;
- (_MKPlaceActionButtonController)initWithTitle:(id)a3 subTitle:(id)a4 analyticsAction:(int)a5 selectedBlock:(id)a6 disabled:(BOOL)a7 symbolName:(id)a8;
- (_MKPlaceActionButtonController)initWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5;
- (_MKPlaceActionControlledButton)delegate;
- (id)buttonSelectedBlock;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (int)analyticsAction;
- (void)buttonTextChanged;
- (void)setDelegate:(id)a3;
@end

@implementation _MKPlaceActionButtonController

- (_MKPlaceActionButtonController)initWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5
{
  return [(_MKPlaceActionButtonController *)self initWithTitle:a3 subTitle:a4 analyticsAction:0 selectedBlock:a5 disabled:0 symbolName:0];
}

- (_MKPlaceActionButtonController)initWithTitle:(id)a3 subTitle:(id)a4 analyticsAction:(int)a5 selectedBlock:(id)a6 disabled:(BOOL)a7 symbolName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  if (v14)
  {
    uint64_t v18 = [v14 length];
    v19 = 0;
    if (v16 && v18)
    {
      v28.receiver = self;
      v28.super_class = (Class)_MKPlaceActionButtonController;
      v20 = [(_MKPlaceActionButtonController *)&v28 init];
      if (v20)
      {
        uint64_t v21 = [v14 copy];
        buttonTitle = v20->_buttonTitle;
        v20->_buttonTitle = (NSString *)v21;

        uint64_t v23 = [v15 copy];
        buttonSubTitle = v20->_buttonSubTitle;
        v20->_buttonSubTitle = (NSString *)v23;

        uint64_t v25 = [v16 copy];
        id buttonSelectedBlock = v20->_buttonSelectedBlock;
        v20->_id buttonSelectedBlock = (id)v25;

        v20->_analyticsAction = a5;
        v20->_disabled = a7;
        objc_storeStrong((id *)&v20->_symbolName, a8);
      }
      self = v20;
      v19 = self;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (_MKPlaceActionButtonController)actionButtonControllerWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5
{
  return (_MKPlaceActionButtonController *)[a1 actionButtonControllerWithTitle:a3 subTitle:a4 selectedBlock:a5 disabled:0 symbolName:0];
}

+ (_MKPlaceActionButtonController)actionButtonControllerWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5 disabled:(BOOL)a6 symbolName:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) initWithTitle:v15 subTitle:v14 analyticsAction:0 selectedBlock:v13 disabled:v7 symbolName:v12];

  return (_MKPlaceActionButtonController *)v16;
}

- (void)buttonTextChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained placeActionButtonControllerTextDidChange:self];
}

- (id)infoCardChildPossibleActions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(_MKPlaceActionButtonController *)self analyticsAction])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[_MKPlaceActionButtonController analyticsAction](self, "analyticsAction"));
    v6[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)buttonSubTitle
{
  return self->_buttonSubTitle;
}

- (id)buttonSelectedBlock
{
  return self->_buttonSelectedBlock;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (_MKPlaceActionControlledButton)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKPlaceActionControlledButton *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (int)analyticsAction
{
  return self->_analyticsAction;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong(&self->_buttonSelectedBlock, 0);
  objc_storeStrong((id *)&self->_buttonSubTitle, 0);

  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end