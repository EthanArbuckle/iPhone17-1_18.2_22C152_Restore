uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

tion IMAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  if (a4 == 1)
  {
    v7 = (void *)MEMORY[0x263F290F0];
    id v8 = a3;
    id v14 = [v7 sharedInstance];
    v9 = [v8 accountPropertyForKey:@"altDSID"];

    if (v9)
    {
      v10 = [v14 authKitAccountWithAltDSID:v9];
      if (v10)
      {
        uint64_t v11 = [v14 securityLevelForAccount:v10];
        if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 0)
        {
          v12 = [MEMORY[0x263F087C8] defaultCenter];
          [v12 postNotificationName:*MEMORY[0x263F4AB40] object:*MEMORY[0x263F4AB40] userInfo:0];
        }
        if (v11 == 4)
        {
          v13 = [MEMORY[0x263F087C8] defaultCenter];
          [v13 postNotificationName:*MEMORY[0x263F4AB38] object:*MEMORY[0x263F4AB38] userInfo:0];
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }
}

@end