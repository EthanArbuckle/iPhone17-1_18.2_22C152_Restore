@interface AFUICacheRuntimeObjects
@end

@implementation AFUICacheRuntimeObjects

uint64_t ___AFUICacheRuntimeObjects_block_invoke()
{
  __AFUIColorClass = (uint64_t)NSClassFromString(&cfstr_Uicolor.isa);
  __AFUIFontClass = (uint64_t)NSClassFromString(&cfstr_Uifont.isa);
  __AFUIResponderClass = (uint64_t)NSClassFromString(&cfstr_Uiresponder.isa);
  __AFUIViewClass = (uint64_t)NSClassFromString(&cfstr_Uiview.isa);
  __AFUIViewControllerClass = (uint64_t)NSClassFromString(&cfstr_Uiviewcontroll.isa);
  __AFUINavigationControllerClass = (uint64_t)NSClassFromString(&cfstr_Uinavigationco.isa);
  __AFUIApplicationClass = (uint64_t)NSClassFromString(&cfstr_Uiapplication.isa);
  __AFUITextFieldClass = (uint64_t)NSClassFromString(&cfstr_Uitextfield.isa);
  __AFUISecureTextFieldClass = (uint64_t)NSClassFromString(&cfstr_Afuifakesecure.isa);
  __AFUITextViewClass = (uint64_t)NSClassFromString(&cfstr_Uitextview.isa);
  __AFUIButtonClass = (uint64_t)NSClassFromString(&cfstr_Uibutton.isa);
  __AFUITraitsClass = (uint64_t)NSClassFromString(&cfstr_Uitextinputtra.isa);
  uint64_t v0 = NSProtocolFromString(&cfstr_Uitextinputtra.isa);
  v1 = (void *)__AFUITraitsProtocol;
  __AFUITraitsProtocol = v0;

  __AFUITextInputProtocol = NSProtocolFromString(&cfstr_Uitextinput.isa);

  return MEMORY[0x270F9A758]();
}

@end