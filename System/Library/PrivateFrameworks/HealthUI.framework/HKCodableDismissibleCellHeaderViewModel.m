@interface HKCodableDismissibleCellHeaderViewModel
- (BOOL)hasBackgroundColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableCellHeaderViewModel)viewModel;
- (HKCodableColorRepresentation)backgroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setViewModel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableDismissibleCellHeaderViewModel

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableDismissibleCellHeaderViewModel;
  v4 = [(HKCodableDismissibleCellHeaderViewModel *)&v8 description];
  v5 = [(HKCodableDismissibleCellHeaderViewModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  viewModel = self->_viewModel;
  if (viewModel)
  {
    v5 = [(HKCodableCellHeaderViewModel *)viewModel dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"viewModel"];
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    v7 = [(HKCodableColorRepresentation *)backgroundColor dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"backgroundColor"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableDismissibleCellHeaderViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_viewModel) {
    -[HKCodableDismissibleCellHeaderViewModel writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_backgroundColor) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setViewModel:self->_viewModel];
  if (self->_backgroundColor) {
    objc_msgSend(v4, "setBackgroundColor:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableCellHeaderViewModel *)self->_viewModel copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HKCodableColorRepresentation *)self->_backgroundColor copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((viewModel = self->_viewModel, !((unint64_t)viewModel | v4[2]))
     || -[HKCodableCellHeaderViewModel isEqual:](viewModel, "isEqual:")))
  {
    backgroundColor = self->_backgroundColor;
    if ((unint64_t)backgroundColor | v4[1]) {
      char v7 = -[HKCodableColorRepresentation isEqual:](backgroundColor, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableCellHeaderViewModel *)self->_viewModel hash];
  return [(HKCodableColorRepresentation *)self->_backgroundColor hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  viewModel = self->_viewModel;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (viewModel)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableCellHeaderViewModel mergeFrom:](viewModel, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableDismissibleCellHeaderViewModel setViewModel:](self, "setViewModel:");
  }
  id v4 = v9;
LABEL_7:
  backgroundColor = self->_backgroundColor;
  uint64_t v8 = v4[1];
  if (backgroundColor)
  {
    if (!v8) {
      goto LABEL_13;
    }
    backgroundColor = (HKCodableColorRepresentation *)-[HKCodableColorRepresentation mergeFrom:](backgroundColor, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    backgroundColor = (HKCodableColorRepresentation *)-[HKCodableDismissibleCellHeaderViewModel setBackgroundColor:](self, "setBackgroundColor:");
  }
  id v4 = v9;
LABEL_13:
  MEMORY[0x1F41817F8](backgroundColor, v4);
}

- (HKCodableCellHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (HKCodableColorRepresentation)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[HKCodableDismissibleCellHeaderViewModel writeTo:]", "HKCodableDismissibleCellHeaderViewModel.m", 114, "self->_viewModel != nil");
}

@end