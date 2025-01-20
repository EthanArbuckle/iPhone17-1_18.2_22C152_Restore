@interface BSUIMapServiceTicket
@end

@implementation BSUIMapServiceTicket

void __43___BSUIMapServiceTicket_submitWithHandler___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x263EFF980];
    id v7 = a2;
    v8 = [v6 array];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43___BSUIMapServiceTicket_submitWithHandler___block_invoke_2;
    v9[3] = &unk_265075B68;
    a2 = v8;
    id v10 = a2;
    [v7 enumerateObjectsUsingBlock:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43___BSUIMapServiceTicket_submitWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = -[BSUIMapItem initWithMKMapItem:]((id *)[BSUIMapItem alloc], v3);

  [*(id *)(a1 + 32) addObject:v4];
}

@end