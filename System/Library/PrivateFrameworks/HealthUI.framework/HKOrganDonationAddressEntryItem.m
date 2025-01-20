@interface HKOrganDonationAddressEntryItem
- (HKOrganDonationAddressEntryItem)initWithRegistrant:(id)a3;
- (id)cell;
- (id)formattedKeyAndValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)textFieldDidChangeValue:(id)a3 forCell:(id)a4;
- (void)updateCellDisplay;
@end

@implementation HKOrganDonationAddressEntryItem

- (HKOrganDonationAddressEntryItem)initWithRegistrant:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HKOrganDonationAddressEntryItem;
  v5 = [(HKOrganDonationAddressEntryItem *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = HKHealthUIFrameworkBundle();
    v8 = [v7 pathForResource:@"USStateAbbreviations" ofType:@"plist"];
    uint64_t v9 = [v6 dictionaryWithContentsOfFile:v8];
    statesDict = v5->_statesDict;
    v5->_statesDict = (NSDictionary *)v9;

    v11 = (NSArray *)[&unk_1F3C1F120 mutableCopy];
    v12 = [(NSDictionary *)v5->_statesDict allKeys];
    v13 = [v12 sortedArrayUsingSelector:sel_localizedCompare_];
    [(NSArray *)v11 addObjectsFromArray:v13];

    sortedStateKeys = v5->_sortedStateKeys;
    v5->_sortedStateKeys = v11;
    v15 = v11;

    uint64_t v16 = [v4 address1];
    address1 = v5->_address1;
    v5->_address1 = (NSString *)v16;

    uint64_t v18 = [v4 address2];
    address2 = v5->_address2;
    v5->_address2 = (NSString *)v18;

    uint64_t v20 = [v4 city];
    city = v5->_city;
    v5->_city = (NSString *)v20;

    uint64_t v22 = [v4 state];
    state = v5->_state;
    v5->_state = (NSString *)v22;

    uint64_t v24 = [v4 zip];
    zipcode = v5->_zipcode;
    v5->_zipcode = (NSString *)v24;
  }
  return v5;
}

- (id)cell
{
  cell = self->_cell;
  if (!cell)
  {
    id v4 = [[HKOrganDonationAddressCell alloc] initWithStyle:0 reuseIdentifier:0];
    v5 = self->_cell;
    self->_cell = v4;

    [(HKOrganDonationAddressCell *)self->_cell setDelegate:self];
    v6 = [(HKOrganDonationAddressCell *)self->_cell streetOneTextField];
    [v6 setText:self->_address1];

    v7 = [(HKOrganDonationAddressCell *)self->_cell streetTwoTextField];
    [v7 setText:self->_address2];

    v8 = [(HKOrganDonationAddressCell *)self->_cell cityTextField];
    [v8 setText:self->_city];

    uint64_t v9 = [(HKOrganDonationAddressCell *)self->_cell stateTextField];
    [v9 setText:self->_state];

    v10 = [(HKOrganDonationAddressCell *)self->_cell zipCodeTextField];
    [v10 setText:self->_zipcode];

    v11 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    statePicker = self->_statePicker;
    self->_statePicker = v11;

    [(UIPickerView *)self->_statePicker setDataSource:self];
    [(UIPickerView *)self->_statePicker setDelegate:self];
    if (self->_state)
    {
      v13 = -[NSDictionary allKeysForObject:](self->_statesDict, "allKeysForObject:");
      v14 = [v13 firstObject];

      [(UIPickerView *)self->_statePicker selectRow:[(NSArray *)self->_sortedStateKeys indexOfObject:v14] inComponent:0 animated:0];
    }
    v15 = +[HKHostingAreaLayoutView viewHostingView:self->_statePicker];
    uint64_t v16 = [(HKOrganDonationAddressCell *)self->_cell stateTextField];
    [v16 setInputView:v15];

    cell = self->_cell;
  }
  return cell;
}

- (id)formattedKeyAndValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  if (self->_address1) {
    address1 = (__CFString *)self->_address1;
  }
  else {
    address1 = &stru_1F3B9CF20;
  }
  [v3 setObject:address1 forKey:@"address1"];
  if (self->_address2) {
    address2 = (__CFString *)self->_address2;
  }
  else {
    address2 = &stru_1F3B9CF20;
  }
  [v4 setObject:address2 forKey:@"address2"];
  if (self->_city) {
    city = (__CFString *)self->_city;
  }
  else {
    city = &stru_1F3B9CF20;
  }
  [v4 setObject:city forKey:@"city"];
  if (self->_state) {
    state = (__CFString *)self->_state;
  }
  else {
    state = &stru_1F3B9CF20;
  }
  [v4 setObject:state forKey:@"state"];
  if (self->_zipcode) {
    zipcode = (__CFString *)self->_zipcode;
  }
  else {
    zipcode = &stru_1F3B9CF20;
  }
  [v4 setObject:zipcode forKey:@"zip"];
  return v4;
}

- (void)updateCellDisplay
{
  id v3 = [(HKOrganDonationAddressCell *)self->_cell stateTextField];
  [v3 setText:self->_state];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_sortedStateKeys count];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v6 = [(NSArray *)self->_sortedStateKeys objectAtIndexedSubscript:a4];
  v7 = [(NSDictionary *)self->_statesDict objectForKeyedSubscript:v6];
  if (v7)
  {
    v8 = [NSString stringWithFormat:@"%@ (%@)", v6, v7];
  }
  else
  {
    v8 = &stru_1F3B9CF20;
  }

  return v8;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  statesDict = self->_statesDict;
  v7 = [(NSArray *)self->_sortedStateKeys objectAtIndexedSubscript:a4];
  v8 = [(NSDictionary *)statesDict objectForKey:v7];
  state = self->_state;
  self->_state = v8;

  [(HKOrganDonationAddressEntryItem *)self updateCellDisplay];
  id v10 = [(HKSimpleDataEntryItem *)self delegate];
  [v10 dataEntryItemDidUpdateValue:self];
}

- (void)textFieldDidChangeValue:(id)a3 forCell:(id)a4
{
  id v14 = a3;
  id v5 = [(HKOrganDonationAddressCell *)self->_cell streetOneTextField];

  if (v5 == v14)
  {
    id v10 = [v14 text];
    uint64_t v11 = 48;
  }
  else
  {
    id v6 = [(HKOrganDonationAddressCell *)self->_cell streetTwoTextField];

    if (v6 == v14)
    {
      id v10 = [v14 text];
      uint64_t v11 = 56;
    }
    else
    {
      id v7 = [(HKOrganDonationAddressCell *)self->_cell cityTextField];

      if (v7 == v14)
      {
        id v10 = [v14 text];
        uint64_t v11 = 64;
      }
      else
      {
        id v8 = [(HKOrganDonationAddressCell *)self->_cell zipCodeTextField];

        uint64_t v9 = v14;
        if (v8 != v14) {
          goto LABEL_10;
        }
        id v10 = [v14 text];
        uint64_t v11 = 80;
      }
    }
  }
  v12 = *(Class *)((char *)&self->super.super.isa + v11);
  *(Class *)((char *)&self->super.super.isa + v11) = v10;

  v13 = [(HKSimpleDataEntryItem *)self delegate];
  [v13 dataEntryItemDidUpdateValue:self];

  uint64_t v9 = v14;
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedStateKeys, 0);
  objc_storeStrong((id *)&self->_statesDict, 0);
  objc_storeStrong((id *)&self->_statePicker, 0);
  objc_storeStrong((id *)&self->_zipcode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_address2, 0);
  objc_storeStrong((id *)&self->_address1, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end