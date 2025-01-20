@interface CFAccentuatedStringCreate
@end

@implementation CFAccentuatedStringCreate

void ___CFAccentuatedStringCreate_block_invoke()
{
  Mutable = CFCharacterSetCreateMutable(0);
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetControl);
  CFCharacterSetUnion(Mutable, Predefined);
  CFCharacterSetRef v2 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  CFCharacterSetUnion(Mutable, v2);
  CFCharacterSetRef v3 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(Mutable, v3);
  CFCharacterSetRef v4 = CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  CFCharacterSetUnion(Mutable, v4);
  CFCharacterSetRef v5 = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  CFCharacterSetUnion(Mutable, v5);
  CFCharacterSetRef v6 = CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
  CFCharacterSetUnion(Mutable, v6);
  _CFAccentuatedStringCreate_charsToSkip = (uint64_t)CFCharacterSetCreateCopy(0, Mutable);

  CFRelease(Mutable);
}

void ___CFAccentuatedStringCreate_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned __int16 a4)
{
  uint64_t v4 = *a3 + 1;
  *(_WORD *)(a2 + 2 * *a3) = _CFAccentuatedStringCreate_acceptableAccentChars[a4 % 6u];
  *a3 = v4;
}

@end