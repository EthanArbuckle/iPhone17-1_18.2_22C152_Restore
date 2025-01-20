@interface _WKWebExtensionKeyCommand
+ (id)commandWithTitle:(id)a3 image:(id)a4 input:(id)a5 modifierFlags:(int64_t)a6 identifier:(id)a7;
@end

@implementation _WKWebExtensionKeyCommand

+ (id)commandWithTitle:(id)a3 image:(id)a4 input:(id)a5 modifierFlags:(int64_t)a6 identifier:(id)a7
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!v11)
  {
    __break(0xC471u);
    JUMPOUT(0x1992DBC64);
  }
  if (!v13)
  {
    __break(0xC471u);
    JUMPOUT(0x1992DBC84);
  }
  v15 = v14;
  if (!v14)
  {
    __break(0xC471u);
    JUMPOUT(0x1992DBCA4);
  }
  v19[0] = @"title";
  v19[1] = @"activation";
  v20[0] = v11;
  v20[1] = v13;
  v19[2] = @"identifier";
  v20[2] = v14;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v17 = [MEMORY[0x1E4F42AF8] commandWithTitle:v11 image:v12 action:sel_performWebExtensionCommandForKeyCommand_ input:v13 modifierFlags:a6 propertyList:v16];

  return v17;
}

@end