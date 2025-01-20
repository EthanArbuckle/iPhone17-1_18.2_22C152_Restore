uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

lementation ACDatabaseBackupNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  if ((a4 & 0xFFFFFFFD) == 1)
  {
    objc_msgSend(a5, "databaseBackupActivity", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 scheduleBackup];
  }
}

@end