@interface WFMakeImageFromPDFPageImageFormatParameter
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (id)readableStringFromFileTypeString:(id)a3;
@end

@implementation WFMakeImageFromPDFPageImageFormatParameter

- (void).cxx_destruct
{
}

- (id)defaultSerializedRepresentation
{
  v2 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
  v3 = (void *)MEMORY[0x263F86F00];
  v4 = [v2 string];
  v5 = [v3 serializedRepresentationFromValue:v4];

  return v5;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v4 = (void *)MEMORY[0x263F852B8];
  v5 = [a3 value];
  v6 = [v4 typeWithString:v5];

  v7 = [v6 typeDescription];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [v6 string];
    id v9 = [(WFMakeImageFromPDFPageImageFormatParameter *)self readableStringFromFileTypeString:v10];
  }
  return v9;
}

- (id)readableStringFromFileTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.atx"])
  {
    v4 = @"ATX";
  }
  else if ([v3 isEqualToString:@"org.khronos.ktx"])
  {
    v4 = @"KTX textures";
  }
  else if ([v3 isEqualToString:@"org.khronos.astc"])
  {
    v4 = @"ASTC textures";
  }
  else if ([v3 isEqualToString:@"com.microsoft.dds"])
  {
    v4 = @"DDS textures";
  }
  else if ([v3 isEqualToString:@"public.pbm"])
  {
    v4 = @"Portable Bitmap Format";
  }
  else if ([v3 isEqualToString:@"public.pvr"])
  {
    v4 = @"PVRTC textures";
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = [MEMORY[0x263F338B0] imageTypes];
    v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_28687);
    v6 = [v5 array];
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __60__WFMakeImageFromPDFPageImageFormatParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 string];

  v6 = (void *)[v4 initWithValue:v5];
  return v6;
}

@end