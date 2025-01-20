@interface BuddyChoiceManager
- (BFFFlowItemDelegate)delegate;
- (BuddyChoiceManager)initWithFlowItem:(id)a3;
- (BuddyChooseable)chooseableDelegate;
- (NSArray)choices;
- (void)_tappedChoice:(id)a3;
- (void)selectChoice:(id)a3;
- (void)setChoices:(id)a3;
- (void)setChooseableDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BuddyChoiceManager

- (BuddyChoiceManager)initWithFlowItem:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v9;
  id v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)BuddyChoiceManager;
  v4 = [(BuddyChoiceManager *)&v7 init];
  id v9 = v4;
  objc_storeStrong(&v9, v4);
  if (v4) {
    objc_storeWeak((id *)v9 + 3, location[0]);
  }
  v5 = (BuddyChoiceManager *)v9;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v5;
}

- (void)setChoices:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_choices != location[0])
  {
    [(NSArray *)v4->_choices makeObjectsPerformSelector:"setChoiceController:" withObject:0];
    objc_storeStrong((id *)&v4->_choices, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_tappedChoice:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  objc_super v7 = sub_10019D5BC;
  v8 = &unk_1002B20E8;
  id v9 = v12;
  id v10 = location[0];
  [v3 runConfirmationIfNeededCompletion:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)selectChoice:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyChoiceManager *)v8 chooseableDelegate];
  BOOL v4 = v3 == 0;

  if (v4)
  {
    int v5 = [(BuddyChoiceManager *)v8 delegate];
    int v6 = [(BuddyChoiceManager *)v8 chooseableDelegate];
    -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v5, "flowItemDone:nextItemClass:", v6, [location[0] nextControllerClass]);
  }
  else
  {
    int v5 = [(BuddyChoiceManager *)v8 chooseableDelegate];
    [(BFFFlowItemDelegate *)v5 didSelectChoice:location[0]];
  }

  objc_storeStrong(location, 0);
}

- (BuddyChooseable)chooseableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chooseableDelegate);

  return (BuddyChooseable *)WeakRetained;
}

- (void)setChooseableDelegate:(id)a3
{
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)choices
{
  return self->_choices;
}

- (void).cxx_destruct
{
}

@end