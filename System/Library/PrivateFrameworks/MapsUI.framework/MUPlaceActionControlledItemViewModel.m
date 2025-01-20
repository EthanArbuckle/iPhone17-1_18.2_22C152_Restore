@interface MUPlaceActionControlledItemViewModel
- (BOOL)isEnabled;
- (MUPlaceActionControlledItemViewModel)initWithPlaceActionController:(id)a3;
- (id)accessibilityIdentifier;
- (id)analyticsButtonValues;
- (id)symbolName;
- (id)titleText;
- (void)performWithPresentationOptions:(id)a3;
@end

@implementation MUPlaceActionControlledItemViewModel

- (MUPlaceActionControlledItemViewModel)initWithPlaceActionController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceActionControlledItemViewModel;
  v6 = [(MUActionRowItemViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_actionButtonController, a3);
  }

  return v7;
}

- (id)titleText
{
  return (id)[(_MKPlaceActionButtonController *)self->_actionButtonController buttonTitle];
}

- (id)symbolName
{
  return (id)[(_MKPlaceActionButtonController *)self->_actionButtonController symbolName];
}

- (BOOL)isEnabled
{
  return [(_MKPlaceActionButtonController *)self->_actionButtonController disabled] ^ 1;
}

- (id)accessibilityIdentifier
{
  v2 = [(MUPlaceActionControlledItemViewModel *)self titleText];
  v3 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s", &stru_1EE3BF360, 1024, 0, objc_msgSend(v2, "length"));
  v4 = [@"ActionRowItemType" stringByAppendingString:v3];

  return v4;
}

- (void)performWithPresentationOptions:(id)a3
{
  id v7 = a3;
  v4 = [(_MKPlaceActionButtonController *)self->_actionButtonController buttonSelectedBlock];

  if (v4)
  {
    id v5 = [(_MKPlaceActionButtonController *)self->_actionButtonController buttonSelectedBlock];
    v6 = [v7 sourceView];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
}

- (id)analyticsButtonValues
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(_MKPlaceActionButtonController *)self->_actionButtonController analyticsAction] == 403)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F64950]);
    [v3 setType:57];
    v8[0] = v3;
    v4 = (id *)v8;
LABEL_5:
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

    goto LABEL_7;
  }
  if ([(_MKPlaceActionButtonController *)self->_actionButtonController analyticsAction] == 405)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F64950]);
    [v3 setType:58];
    id v7 = v3;
    v4 = &v7;
    goto LABEL_5;
  }
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v5;
}

- (void).cxx_destruct
{
}

@end