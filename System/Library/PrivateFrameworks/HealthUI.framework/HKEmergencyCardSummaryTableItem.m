@interface HKEmergencyCardSummaryTableItem
- (BOOL)hasPresentableData;
- (UIEdgeInsets)separatorInset;
- (id)_cell;
- (id)initInEditMode:(BOOL)a3;
- (void)localeDidChange:(id)a3;
- (void)setData:(id)a3;
- (void)timeZoneDidChange:(id)a3;
@end

@implementation HKEmergencyCardSummaryTableItem

- (id)initInEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKEmergencyCardSummaryTableItem.m" lineNumber:18 description:@"HKEmergencyCardSummaryTableItem does not support edit mode"];
  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardSummaryTableItem;
  return [(HKEmergencyCardTableItem *)&v8 initInEditMode:v3];
}

- (void)localeDidChange:(id)a3
{
}

- (void)timeZoneDidChange:(id)a3
{
}

- (BOOL)hasPresentableData
{
  BOOL v3 = [(HKEmergencyCardTableItem *)self data];
  v4 = [v3 pictureData];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(HKEmergencyCardTableItem *)self data];
    v7 = [v6 name];
    if (v7)
    {
      BOOL v5 = 1;
    }
    else
    {
      objc_super v8 = [(HKEmergencyCardTableItem *)self data];
      v9 = [v8 gregorianBirthday];
      if (v9)
      {
        BOOL v5 = 1;
      }
      else
      {
        v10 = [(HKEmergencyCardTableItem *)self data];
        v11 = [v10 height];
        if (v11)
        {
          BOOL v5 = 1;
        }
        else
        {
          v17 = [(HKEmergencyCardTableItem *)self data];
          v12 = [v17 weight];
          if (v12)
          {
            BOOL v5 = 1;
          }
          else
          {
            v16 = [(HKEmergencyCardTableItem *)self data];
            if ([v16 bloodType])
            {
              BOOL v5 = 1;
            }
            else
            {
              v15 = [(HKEmergencyCardTableItem *)self data];
              v13 = [v15 isOrganDonor];
              BOOL v5 = v13 != 0;
            }
          }
        }
      }
    }
  }

  return v5;
}

- (id)_cell
{
  cell = self->_cell;
  if (!cell)
  {
    v4 = objc_alloc_init(HKMedicalIDPersonSummaryCell);
    BOOL v5 = self->_cell;
    self->_cell = v4;

    [(HKMedicalIDPersonSummaryCell *)self->_cell setAccessoryType:[(HKEmergencyCardTableItem *)self isInEditMode]];
    cell = self->_cell;
  }
  return cell;
}

- (void)setData:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKEmergencyCardSummaryTableItem;
  id v4 = a3;
  [(HKEmergencyCardTableItem *)&v13 setData:v4];
  BOOL v5 = [(HKEmergencyCardSummaryTableItem *)self _cell];
  v6 = (void *)MEMORY[0x1E4FB1818];
  v7 = [v4 pictureData];
  objc_super v8 = [v6 imageWithData:v7];
  [v5 setPicture:v8];

  v9 = [v4 name];
  [v5 setName:v9];

  v10 = [v4 gregorianBirthday];
  [v5 setGregorianBirthday:v10];

  v11 = [v4 isOrganDonor];
  [v5 setOrganDonationStatus:v11];

  objc_msgSend(v5, "setShareOnLockScreen:", objc_msgSend(v4, "isDisabled") ^ 1);
  uint64_t v12 = [v4 shareDuringEmergency];

  [v5 setShareDuringEmergencyCalls:v12];
  [v5 updateSubviewsFromData];
}

- (UIEdgeInsets)separatorInset
{
  double v2 = 999.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end