@interface WFImageConvertFormatPickerParameter
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFImageConvertFormatPickerParameter

- (void).cxx_destruct
{
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = a3;
  v4 = [v3 value];
  if ([v4 isEqualToString:@"Match Input"]) {
    WFLocalizedString(@"Match Input");
  }
  else {
  v5 = [v3 value];
  }

  return v5;
}

- (id)possibleStates
{
  v12[6] = *MEMORY[0x263EF8340];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v12[0] = @"JPEG";
    v12[1] = @"PNG";
    v12[2] = @"TIFF";
    v12[3] = @"GIF";
    v12[4] = @"BMP";
    v12[5] = @"PDF";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v5 = (void *)[v4 mutableCopy];

    v6 = [MEMORY[0x263F338B0] supportedTypes];
    v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAE8]];
    int v8 = [v6 containsObject:v7];

    if (v8) {
      [v5 addObject:@"HEIF"];
    }
    [v5 addObject:@"Match Input"];
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_29980);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __53__WFImageConvertFormatPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

@end