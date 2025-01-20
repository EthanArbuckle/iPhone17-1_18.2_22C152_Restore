@interface CNSharedProfileUpdateMenuElement
+ (id)elementWithTitle:(id)a3 subtitle:(id)a4 avatarImage:(id)a5 selected:(BOOL)a6;
@end

@implementation CNSharedProfileUpdateMenuElement

+ (id)elementWithTitle:(id)a3 subtitle:(id)a4 avatarImage:(id)a5 selected:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__CNSharedProfileUpdateMenuElement_elementWithTitle_subtitle_avatarImage_selected___block_invoke;
  v19[3] = &unk_1E5497628;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  BOOL v23 = a6;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___CNSharedProfileUpdateMenuElement;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  v16 = objc_msgSendSuper2(&v18, sel_elementWithViewProvider_, v19);

  return v16;
}

id __83__CNSharedProfileUpdateMenuElement_elementWithTitle_subtitle_avatarImage_selected___block_invoke(uint64_t a1)
{
  v56[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*(void *)(a1 + 32)];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [v8 setText:*(void *)(a1 + 40)];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v55 = v8;
  [v8 setFont:v9];

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  [v10 setText:*(void *)(a1 + 48)];
  id v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
  [v10 setFont:v11];

  id v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setTextColor:v12];

  v54 = v10;
  [v10 setNumberOfLines:2];
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", v4, v5, v6, v7);
  [v13 setAxis:1];
  [v13 setAlignment:1];
  [v13 addArrangedSubview:v8];
  v51 = v13;
  [v13 addArrangedSubview:v10];
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", v4, v5, v6, v7);
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setAxis:0];
  [v14 setAlignment:3];
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v5, v6, v7);
  v53 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2908] scale:1];
  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v53];
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  objc_super v18 = [v16 imageWithTintColor:v17];

  v52 = [v18 imageWithRenderingMode:1];

  [v15 setImage:v52];
  double v19 = 1.0;
  if (!*(unsigned char *)(a1 + 56)) {
    double v19 = 0.0;
  }
  [v15 setAlpha:v19];
  [v15 setContentMode:1];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 addArrangedSubview:v15];
  v38 = v15;
  [v14 setCustomSpacing:v15 afterView:6.0];
  [v14 addArrangedSubview:v13];
  v50 = v2;
  [v14 addArrangedSubview:v2];
  id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 addSubview:v14];
  v49 = [v2 widthAnchor];
  v48 = [v49 constraintEqualToConstant:28.0];
  v56[0] = v48;
  v47 = [v2 heightAnchor];
  v46 = [v2 widthAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v56[1] = v45;
  v44 = [v2 centerYAnchor];
  v43 = [v20 centerYAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v56[2] = v42;
  v41 = [v14 trailingAnchor];
  v40 = [v20 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40 constant:-16.0];
  v56[3] = v39;
  v37 = [v14 topAnchor];
  v36 = [v20 topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:12.0];
  v56[4] = v35;
  v34 = [v14 bottomAnchor];
  v33 = [v20 bottomAnchor];
  v31 = [v34 constraintEqualToAnchor:v33 constant:-12.0];
  v56[5] = v31;
  v30 = [v14 centerYAnchor];
  id v21 = [v20 centerYAnchor];
  id v22 = [v30 constraintEqualToAnchor:v21];
  v56[6] = v22;
  BOOL v23 = [v14 leadingAnchor];
  v24 = [v20 leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:12.0];
  v56[7] = v25;
  v26 = [v15 centerYAnchor];
  v27 = [v20 centerYAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v56[8] = v28;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:9];

  [MEMORY[0x1E4F28DC8] activateConstraints:v32];

  return v20;
}

@end