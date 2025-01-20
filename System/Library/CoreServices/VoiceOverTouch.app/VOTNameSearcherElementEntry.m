@interface VOTNameSearcherElementEntry
- (BOOL)isEqual:(id)a3;
- (NSString)itemChooserName;
- (VOTElement)element;
- (VOTNameSearcherElementEntry)initWithElement:(id)a3;
- (void)select;
- (void)setElement:(id)a3;
- (void)setItemChooserName:(id)a3;
@end

@implementation VOTNameSearcherElementEntry

- (VOTNameSearcherElementEntry)initWithElement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VOTNameSearcherElementEntry;
  v5 = [(VOTNameSearcherElementEntry *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(VOTNameSearcherElementEntry *)v5 setElement:v4];
    v7 = [v4 itemChooserName];
    [(VOTNameSearcherElementEntry *)v6 setItemChooserName:v7];

    v8 = v6;
  }

  return v6;
}

- (void)select
{
  v3 = [(id)VOTSharedWorkspace elementManager];
  id v4 = [(VOTNameSearcherElementEntry *)self element];
  [v3 handleNotification:1020 withData:v4 forElement:0];

  id v5 = [(id)VOTSharedWorkspace elementManager];
  [v5 deactivateGesturedTextInputIfNeeded:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 element];
    v6 = [(VOTNameSearcherElementEntry *)self element];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (VOTElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (NSString)itemChooserName
{
  return self->_itemChooserName;
}

- (void)setItemChooserName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemChooserName, 0);

  objc_storeStrong((id *)&self->_element, 0);
}

@end