@interface MapsSuggestionsLocalizedTicketedEvent
@end

@implementation MapsSuggestionsLocalizedTicketedEvent

void __MapsSuggestionsLocalizedTicketedEvent_SectionString_block_invoke()
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "LocalizedString";
  if (qword_1EB6F0888 != -1) {
    dispatch_once(&qword_1EB6F0888, block);
  }
  id v0 = (id)qword_1EB6F0880;
  v1 = [v0 localizedStringForKey:@"MAPS_FIM_TICKETED_EVENT_SEAT_SECTION" value:@"Section %@<unlocalized>" table:0];
  v2 = MapsSuggestionsNonNilString(v1, &stru_1EFC640F8);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __MapsSuggestionsLocalizedTicketedEvent_SectionString_block_invoke_2;
  v6[3] = &unk_1E5CBAB20;
  id v7 = v2;
  id v3 = v2;
  v4 = _Block_copy(v6);
  v5 = (void *)qword_1EB6F06E0;
  qword_1EB6F06E0 = (uint64_t)v4;
}

id __MapsSuggestionsLocalizedTicketedEvent_SectionString_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithFormat:", *(void *)(a1 + 32), v4);

  return v5;
}

void __MapsSuggestionsLocalizedTicketedEvent_SeatRowString_block_invoke()
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "LocalizedString";
  if (qword_1EB6F0888 != -1) {
    dispatch_once(&qword_1EB6F0888, block);
  }
  id v0 = (id)qword_1EB6F0880;
  v1 = [v0 localizedStringForKey:@"MAPS_FIM_TICKETED_EVENT_SEAT_ROW" value:@"Row %@<unlocalized>" table:0];
  v2 = MapsSuggestionsNonNilString(v1, &stru_1EFC640F8);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __MapsSuggestionsLocalizedTicketedEvent_SeatRowString_block_invoke_2;
  v6[3] = &unk_1E5CBAB20;
  id v7 = v2;
  id v3 = v2;
  id v4 = _Block_copy(v6);
  v5 = (void *)qword_1EB6F06F0;
  qword_1EB6F06F0 = (uint64_t)v4;
}

id __MapsSuggestionsLocalizedTicketedEvent_SeatRowString_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithFormat:", *(void *)(a1 + 32), v4);

  return v5;
}

void __MapsSuggestionsLocalizedTicketedEvent_SeatNumberString_block_invoke()
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "LocalizedString";
  if (qword_1EB6F0888 != -1) {
    dispatch_once(&qword_1EB6F0888, block);
  }
  id v0 = (id)qword_1EB6F0880;
  v1 = [v0 localizedStringForKey:@"MAPS_FIM_TICKETED_EVENT_SEAT_NUMBER" value:@"Seat %@<unlocalized>" table:0];
  v2 = MapsSuggestionsNonNilString(v1, &stru_1EFC640F8);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __MapsSuggestionsLocalizedTicketedEvent_SeatNumberString_block_invoke_2;
  v6[3] = &unk_1E5CBAB20;
  id v7 = v2;
  id v3 = v2;
  id v4 = _Block_copy(v6);
  v5 = (void *)qword_1EB6F0700;
  qword_1EB6F0700 = (uint64_t)v4;
}

id __MapsSuggestionsLocalizedTicketedEvent_SeatNumberString_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithFormat:", *(void *)(a1 + 32), v4);

  return v5;
}

@end