@interface MKArtworkLabelView
- (MKServerFormattedString)formattedString;
- (void)setFormattedString:(id)a3;
@end

@implementation MKArtworkLabelView

- (void)setFormattedString:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(MKServerFormattedString *)self->_formattedString isEqualToServerFormattedString:v5])
  {
    objc_storeStrong((id *)&self->_formattedString, a3);
    [(_MKUILabel *)self set_mapkit_themeColorProvider:&__block_literal_global_28];
    v6 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43890] maximumContentSizeCategory:*MEMORY[0x1E4F43778]];
    uint64_t v10 = *MEMORY[0x1E4F42508];
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [v5 multiPartAttributedStringWithAttributes:v7];
    v9 = [v8 attributedString];
    [(MKArtworkLabelView *)self setAttributedText:v9];
  }
}

uint64_t __41__MKArtworkLabelView_setFormattedString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

- (MKServerFormattedString)formattedString
{
  return self->_formattedString;
}

- (void).cxx_destruct
{
}

@end