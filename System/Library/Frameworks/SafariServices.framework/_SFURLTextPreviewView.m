@interface _SFURLTextPreviewView
- (NSURL)URL;
- (_SFURLTextPreviewView)initWithURL:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation _SFURLTextPreviewView

- (_SFURLTextPreviewView)initWithURL:(id)a3
{
  v49[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)_SFURLTextPreviewView;
  v5 = [(_SFURLTextPreviewView *)&v48 init];
  if (v5)
  {
    id v47 = v4;
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    domainLabel = v5->_domainLabel;
    v5->_domainLabel = v6;

    [(UILabel *)v5->_domainLabel setClipsToBounds:1];
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v5->_domainLabel setBackgroundColor:v8];

    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v5->_domainLabel setTextColor:v9];

    [(UILabel *)v5->_domainLabel setOpaque:0];
    [(UILabel *)v5->_domainLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_domainLabel setNumberOfLines:1];
    [(UILabel *)v5->_domainLabel setLineBreakMode:4];
    [(_SFURLTextPreviewView *)v5 addSubview:v5->_domainLabel];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    urlLabel = v5->_urlLabel;
    v5->_urlLabel = v10;

    [(UILabel *)v5->_urlLabel setClipsToBounds:1];
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v5->_urlLabel setBackgroundColor:v12];

    [(UILabel *)v5->_urlLabel setOpaque:0];
    [(UILabel *)v5->_urlLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_urlLabel setNumberOfLines:3];
    [(UILabel *)v5->_urlLabel setLineBreakMode:4];
    v13 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v14 = *MEMORY[0x1E4FB2950];
    v15 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
    v16 = [v15 fontDescriptorWithSymbolicTraits:2];
    v17 = [v13 fontWithDescriptor:v16 size:0.0];
    [(UILabel *)v5->_domainLabel setFont:v17];

    v18 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v14];
    [(UILabel *)v5->_urlLabel setFont:v18];

    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_urlLabel setTextColor:v19];

    [(_SFURLTextPreviewView *)v5 addSubview:v5->_urlLabel];
    v20 = [(_SFURLTextPreviewView *)v5 layoutMarginsGuide];
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v46 = [(UILabel *)v5->_domainLabel leadingAnchor];
    v45 = [(_SFURLTextPreviewView *)v5 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v49[0] = v44;
    v43 = [(UILabel *)v5->_domainLabel trailingAnchor];
    v42 = [(_SFURLTextPreviewView *)v5 trailingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v49[1] = v41;
    v40 = [(UILabel *)v5->_urlLabel leadingAnchor];
    v39 = [(_SFURLTextPreviewView *)v5 leadingAnchor];
    v37 = [v40 constraintEqualToAnchor:v39];
    v49[2] = v37;
    v35 = [(UILabel *)v5->_urlLabel trailingAnchor];
    v34 = [(_SFURLTextPreviewView *)v5 trailingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v49[3] = v33;
    v38 = v20;
    v32 = [v20 bottomAnchor];
    v21 = [(UILabel *)v5->_urlLabel bottomAnchor];
    v22 = [v32 constraintGreaterThanOrEqualToAnchor:v21];
    v49[4] = v22;
    v23 = [(UILabel *)v5->_domainLabel topAnchor];
    v24 = [v20 topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v49[5] = v25;
    v26 = [(UILabel *)v5->_urlLabel topAnchor];
    v27 = [(UILabel *)v5->_domainLabel bottomAnchor];
    v28 = [v26 constraintEqualToSystemSpacingBelowAnchor:v27 multiplier:1.0];
    v49[6] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:7];
    [v36 activateConstraints:v29];

    id v4 = v47;
    [(_SFURLTextPreviewView *)v5 setURL:v47];
    v30 = v5;
  }
  return v5;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
  id v5 = a3;
  v6 = objc_msgSend(v5, "_lp_simplifiedDisplayString");
  [(UILabel *)self->_domainLabel setText:v6];

  v7 = objc_msgSend(v5, "_lp_userVisibleString");
  [(UILabel *)self->_urlLabel setText:v7];

  [(_SFURLTextPreviewView *)self setNeedsLayout];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_urlLabel, 0);

  objc_storeStrong((id *)&self->_domainLabel, 0);
}

@end