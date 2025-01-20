@interface CDPUICustodianInstructionsViewModel
- (CDPEscapeOption)continueOption;
- (CDPRemoteValidationEscapeOffer)escapeOffer;
- (NSString)footerText;
- (NSString)instructionHeader;
- (NSString)instructions;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContinueOption:(id)a3;
- (void)setEscapeOffer:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setInstructionHeader:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CDPUICustodianInstructionsViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CDPUICustodianInstructionsViewModel allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_subtitle copy];
  subtitle = v4->_subtitle;
  v4->_subtitle = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_instructionHeader copy];
  instructionHeader = v4->_instructionHeader;
  v4->_instructionHeader = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_instructions copy];
  instructions = v4->_instructions;
  v4->_instructions = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_footerText copy];
  footerText = v4->_footerText;
  v4->_footerText = (NSString *)v13;

  objc_storeStrong((id *)&v4->_escapeOffer, self->_escapeOffer);
  objc_storeStrong((id *)&v4->_continueOption, self->_continueOption);
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)instructionHeader
{
  return self->_instructionHeader;
}

- (void)setInstructionHeader:(id)a3
{
}

- (NSString)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (void)setEscapeOffer:(id)a3
{
}

- (CDPEscapeOption)continueOption
{
  return self->_continueOption;
}

- (void)setContinueOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueOption, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_instructionHeader, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end