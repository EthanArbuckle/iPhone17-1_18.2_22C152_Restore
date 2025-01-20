@interface MUTextFactoidViewModel
- (BOOL)shouldReverseForRTLLayout;
- (MUTextFactoidViewModel)initWithTitle:(id)a3 valueString:(id)a4 symbolName:(id)a5 symbolColor:(id)a6 darkSymbolColor:(id)a7 shouldReverseForRTLLayout:(BOOL)a8;
- (id)buildSymbolWithFont:(id)a3;
- (id)darkSymbolColor;
- (id)symbolColor;
- (id)symbolName;
- (id)titleString;
- (id)valueString;
@end

@implementation MUTextFactoidViewModel

- (MUTextFactoidViewModel)initWithTitle:(id)a3 valueString:(id)a4 symbolName:(id)a5 symbolColor:(id)a6 darkSymbolColor:(id)a7 shouldReverseForRTLLayout:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v22 = a5;
  id v21 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MUTextFactoidViewModel;
  v18 = [(MUTextFactoidViewModel *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_titleString, a3);
    objc_storeStrong((id *)&v19->_valueString, a4);
    objc_storeStrong((id *)&v19->_symbolName, a5);
    objc_storeStrong((id *)&v19->_symbolColor, a6);
    objc_storeStrong((id *)&v19->_darkSymbolColor, a7);
    v19->_shouldReverseForRTLLayout = a8;
  }

  return v19;
}

- (id)buildSymbolWithFont:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  symbolName = self->_symbolName;
  id v5 = a3;
  v6 = objc_msgSend(v3, "_mapsui_systemImageNamed:", symbolName);
  v7 = [MEMORY[0x1E4FB1830] configurationWithFont:v5 scale:1];

  v8 = [v6 imageWithSymbolConfiguration:v7];

  return v8;
}

- (id)symbolName
{
  return self->_symbolName;
}

- (id)titleString
{
  return self->_titleString;
}

- (id)valueString
{
  return self->_valueString;
}

- (id)symbolColor
{
  return self->_symbolColor;
}

- (id)darkSymbolColor
{
  return self->_darkSymbolColor;
}

- (BOOL)shouldReverseForRTLLayout
{
  return self->_shouldReverseForRTLLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkSymbolColor, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end