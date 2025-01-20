@interface _MSSCellularDataEnabledInvocation
- (BOOL)enabled;
- (_MSSCellularDataEnabledInvocation)init;
- (_MSSCellularDataEnabledInvocation)initWithSpecifier:(id)a3 changeHandler:(id)a4;
- (id)_cellularDataEnabledForSpecifier:(id)a3;
- (void)_setCellularDataEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation _MSSCellularDataEnabledInvocation

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_changeHandler, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

- (BOOL)enabled
{
  v2 = [(_MSSCellularDataEnabledInvocation *)self _cellularDataEnabledForSpecifier:self->_specifier];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)_cellularDataEnabledForSpecifier:(id)a3
{
  p_target = &self->_target;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_target);
  v7 = WeakRetained;
  getter = self->_getter;
  if (getter) {
    objc_msgSend(WeakRetained, getter, v5);
  }
  else {
  v9 = objc_msgSend(WeakRetained, 0, v5);
  }

  return v9;
}

- (void)_setCellularDataEnabled:(id)a3 forSpecifier:(id)a4
{
  p_target = &self->_target;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(p_target);
  v10 = WeakRetained;
  setter = self->_setter;
  if (setter) {
    objc_msgSend(WeakRetained, setter, v8, v7);
  }
  else {
    objc_msgSend(WeakRetained, 0, v8, v7);
  }

  v12 = (void (*)(void))*((void *)self->_changeHandler + 2);

  v12();
}

- (_MSSCellularDataEnabledInvocation)init
{
}

- (_MSSCellularDataEnabledInvocation)initWithSpecifier:(id)a3 changeHandler:(id)a4
{
  id v8 = (char *)a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MSSCellularDataSettingsController.m", 41, @"Invalid parameter not satisfying: %@", @"specifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2, self, @"MSSCellularDataSettingsController.m", 42, @"Invalid parameter not satisfying: %@", @"changeHandler" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)_MSSCellularDataEnabledInvocation;
  v11 = [(_MSSCellularDataEnabledInvocation *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_specifier, a3);
    id v13 = objc_retainBlock(v10);
    id changeHandler = v12->_changeHandler;
    v12->_id changeHandler = v13;

    id WeakRetained = objc_loadWeakRetained((id *)&v8[OBJC_IVAR___PSSpecifier_target]);
    objc_storeWeak(&v12->_target, WeakRetained);

    v12->_getter = *(SEL *)&v8[OBJC_IVAR___PSSpecifier_getter];
    v12->_setter = *(SEL *)&v8[OBJC_IVAR___PSSpecifier_setter];
    objc_storeWeak((id *)&v8[OBJC_IVAR___PSSpecifier_target], v12);
    *(void *)&v8[OBJC_IVAR___PSSpecifier_getter] = "_cellularDataEnabledForSpecifier:";
    *(void *)&v8[OBJC_IVAR___PSSpecifier_setter] = "_setCellularDataEnabled:forSpecifier:";
  }

  return v12;
}

@end