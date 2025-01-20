@interface _HKLegendEntryView
- (HKLegendEntry)legendEntry;
- (_HKLegendEntryView)initWithLegendEntry:(id)a3;
- (void)setLegendEntry:(id)a3;
@end

@implementation _HKLegendEntryView

- (_HKLegendEntryView)initWithLegendEntry:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKLegendEntryView;
  v5 = [(_HKLegendEntryView *)&v17 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  v6 = v5;
  if (v5)
  {
    [(_HKLegendEntryView *)v5 setAlignment:3];
    [(_HKLegendEntryView *)v6 setDistribution:0];
    [(_HKLegendEntryView *)v6 setAxis:0];
    [(_HKLegendEntryView *)v6 setSpacing:5.0];
    LODWORD(v7) = 1144750080;
    [(_HKLegendEntryView *)v6 setContentHuggingPriority:0 forAxis:v7];
    LODWORD(v8) = 1144750080;
    [(_HKLegendEntryView *)v6 setContentHuggingPriority:1 forAxis:v8];
    v9 = objc_alloc_init(_HKLegendDot);
    legendDot = v6->_legendDot;
    v6->_legendDot = v9;

    [(_HKLegendEntryView *)v6 addArrangedSubview:v6->_legendDot];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    legendIcon = v6->_legendIcon;
    v6->_legendIcon = (UIImageView *)v11;

    [(_HKLegendEntryView *)v6 addArrangedSubview:v6->_legendIcon];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    legendLabel = v6->_legendLabel;
    v6->_legendLabel = v13;

    v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
    [(UILabel *)v6->_legendLabel setFont:v15];

    [(_HKLegendEntryView *)v6 addArrangedSubview:v6->_legendLabel];
    [(_HKLegendEntryView *)v6 setLegendEntry:v4];
  }

  return v6;
}

- (void)setLegendEntry:(id)a3
{
  p_currentLegendEntry = &self->_currentLegendEntry;
  id v37 = a3;
  if (-[HKLegendEntry isEqual:](*p_currentLegendEntry, "isEqual:")) {
    goto LABEL_22;
  }
  v6 = [(HKLegendEntry *)*p_currentLegendEntry title];
  double v7 = [v37 title];
  if ([v6 isEqualToString:v7])
  {
    double v8 = [(HKLegendEntry *)*p_currentLegendEntry labelColor];
    v9 = [v37 labelColor];
    int v10 = [v8 isEqual:v9];

    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v11 = [v37 title];
  [(UILabel *)self->_legendLabel setText:v11];

  v12 = [v37 labelColor];
  if (v12)
  {
    [(UILabel *)self->_legendLabel setTextColor:v12];
  }
  else
  {
    v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_legendLabel setTextColor:v13];
  }
  [(UILabel *)self->_legendLabel sizeToFit];
LABEL_10:
  v14 = [(UILabel *)self->_legendLabel text];
  -[UILabel setHidden:](self->_legendLabel, "setHidden:", [v14 length] == 0);

  v15 = [(HKLegendEntry *)*p_currentLegendEntry icon];
  v16 = [v37 icon];
  if (v15 != v16)
  {

    objc_super v17 = v37;
LABEL_13:
    legendIcon = self->_legendIcon;
    v21 = [v17 iconTint];
    [(UIImageView *)legendIcon setTintColor:v21];

    v22 = [v37 iconTint];

    v23 = self->_legendIcon;
    v24 = [v37 icon];
    v25 = v24;
    if (v22)
    {
      v26 = [v24 imageWithRenderingMode:2];
      [(UIImageView *)v23 setImage:v26];
    }
    else
    {
      [(UIImageView *)v23 setImage:v24];
    }

    objc_super v17 = v37;
    goto LABEL_17;
  }
  v18 = [(HKLegendEntry *)*p_currentLegendEntry iconTint];
  v19 = [v37 iconTint];

  objc_super v17 = v37;
  if (v18 != v19) {
    goto LABEL_13;
  }
LABEL_17:
  v27 = [v17 icon];
  [(UIImageView *)self->_legendIcon setHidden:v27 == 0];

  v28 = [(HKLegendEntry *)*p_currentLegendEntry dotColor];
  v29 = [v37 dotColor];
  char v30 = [v28 isEqual:v29];

  if ((v30 & 1) == 0)
  {
    v31 = [v37 dotColor];
    [(_HKLegendDot *)self->_legendDot setDotColor:v31];
  }
  v32 = [(HKLegendEntry *)*p_currentLegendEntry innerDotColor];
  v33 = [v37 innerDotColor];
  char v34 = [v32 isEqual:v33];

  if ((v34 & 1) == 0)
  {
    v35 = [v37 innerDotColor];
    [(_HKLegendDot *)self->_legendDot setInnerDotColor:v35];
  }
  v36 = [v37 dotColor];
  [(_HKLegendDot *)self->_legendDot setHidden:v36 == 0];

  objc_storeStrong((id *)&self->_currentLegendEntry, a3);
LABEL_22:
}

- (HKLegendEntry)legendEntry
{
  return self->_legendEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendEntry, 0);
  objc_storeStrong((id *)&self->_legendIcon, 0);
  objc_storeStrong((id *)&self->_legendDot, 0);
  objc_storeStrong((id *)&self->_legendLabel, 0);
  objc_storeStrong((id *)&self->_currentLegendEntry, 0);
}

@end