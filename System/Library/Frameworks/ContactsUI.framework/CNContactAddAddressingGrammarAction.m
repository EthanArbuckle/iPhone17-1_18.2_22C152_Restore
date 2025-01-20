@interface CNContactAddAddressingGrammarAction
+ (id)os_log;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6;
- (NSIndexPath)indexPath;
- (NSTermOfAddress)selectedAddressingGrammar;
- (void)performActionWithSender:(id)a3;
- (void)pronounPickerViewController:(id)a3 didFinishWithTermOfAddress:(id)a4;
- (void)pronounPickerViewControllerDidCancel:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setSelectedAddressingGrammar:(id)a3;
@end

@implementation CNContactAddAddressingGrammarAction

+ (id)os_log
{
  if (os_log_cn_once_token_1_1938 != -1) {
    dispatch_once(&os_log_cn_once_token_1_1938, &__block_literal_global_1939);
  }
  v2 = (void *)os_log_cn_once_object_1_1940;

  return v2;
}

void __45__CNContactAddAddressingGrammarAction_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNContactAddAddressingGrammarAction");
  v1 = (void *)os_log_cn_once_object_1_1940;
  os_log_cn_once_object_1_1940 = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_selectedAddressingGrammar, 0);
}

- (void)setIndexPath:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setSelectedAddressingGrammar:(id)a3
{
}

- (NSTermOfAddress)selectedAddressingGrammar
{
  return self->_selectedAddressingGrammar;
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6
{
  return 0;
}

- (void)pronounPickerViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  [(CNContactAddAddressingGrammarAction *)self setSelectedAddressingGrammar:0];
  v5 = [(CNContactAction *)self delegate];
  [v5 actionWasCanceled:self];

  id v6 = [(CNContactAction *)self delegate];
  [v6 action:self dismissViewController:v4 sender:self];
}

- (void)pronounPickerViewController:(id)a3 didFinishWithTermOfAddress:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  if ([v10 isUnspecified]) {
    id v7 = 0;
  }
  else {
    id v7 = v10;
  }
  [(CNContactAddAddressingGrammarAction *)self setSelectedAddressingGrammar:v7];
  v8 = [(CNContactAction *)self delegate];
  [v8 actionDidFinish:self];

  v9 = [(CNContactAction *)self delegate];
  [v9 action:self dismissViewController:v6 sender:self];
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  [(CNContactAddAddressingGrammarAction *)self setSelectedAddressingGrammar:0];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getIPPronounPickerViewControllerClass_softClass;
  uint64_t v13 = getIPPronounPickerViewControllerClass_softClass;
  if (!getIPPronounPickerViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getIPPronounPickerViewControllerClass_block_invoke;
    v9[3] = &unk_1E549AD00;
    v9[4] = &v10;
    __getIPPronounPickerViewControllerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [v6 pronounPickerViewControllerWithDelegate:self];
  v8 = [(CNContactAction *)self delegate];
  [v8 action:self presentViewController:v7 sender:v4];
}

@end