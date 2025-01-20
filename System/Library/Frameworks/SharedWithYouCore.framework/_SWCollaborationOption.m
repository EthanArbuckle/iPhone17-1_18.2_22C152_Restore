@interface _SWCollaborationOption
- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 selected:(BOOL)a5;
- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 requiredOptionsIdentifiers:(id)a6;
- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 requiredOptionsIdentifiers:(id)a7;
@end

@implementation _SWCollaborationOption

- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 requiredOptionsIdentifiers:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = v15;
  if (v14)
  {
    v17 = (__CFString *)[v14 copy];
    if (v16)
    {
LABEL_3:
      v18 = (void *)[v16 copy];
      goto LABEL_6;
    }
  }
  else
  {
    v17 = &stru_1ED99C438;
    if (v15) {
      goto LABEL_3;
    }
  }
  v18 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)_SWCollaborationOption;
  v19 = [(SWCollaborationOption *)&v21 initWithTitle:v12 identifier:v13 subtitle:v17 selected:v8 requiredOptionsIdentifiers:v18];
  if (v16) {

  }
  if (v14) {
  return v19;
  }
}

- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 selected:(BOOL)a5
{
  return [(_SWCollaborationOption *)self initWithTitle:a3 identifier:a4 subtitle:&stru_1ED99C438 selected:a5 requiredOptionsIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 requiredOptionsIdentifiers:(id)a6
{
  return [(_SWCollaborationOption *)self initWithTitle:a3 identifier:a4 subtitle:a5 selected:0 requiredOptionsIdentifiers:a6];
}

@end