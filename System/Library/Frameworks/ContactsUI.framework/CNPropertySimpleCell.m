@interface CNPropertySimpleCell
- (UILabel)labelLabel;
- (UILabel)valueLabel;
- (id)labelView;
- (id)valueView;
@end

@implementation CNPropertySimpleCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);

  objc_storeStrong((id *)&self->_labelLabel, 0);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (id)valueView
{
  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    v4 = [(CNLabeledCell *)self standardValueView];
    v5 = self->_valueLabel;
    self->_valueLabel = v4;

    valueLabel = self->_valueLabel;
  }

  return valueLabel;
}

- (id)labelView
{
  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    v4 = [(CNLabeledCell *)self standardLabelView];
    v5 = self->_labelLabel;
    self->_labelLabel = v4;

    labelLabel = self->_labelLabel;
  }

  return labelLabel;
}

@end