id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

void objc_release(id a1)
{
}

oid)updateStatistics
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:@"BackBoard" serviceBundleName:@"AXAggregateStatisticsServer"];
  [v2 sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:1 targetAccessQueue:0 completion:0];
}

@end