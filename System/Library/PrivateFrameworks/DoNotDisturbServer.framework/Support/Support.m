void start()
{
  void *v0;
  void *v1;

  v1 = (void *)os_transaction_create();
  _set_user_dir_suffix();
  DNDSRunServer();

  dispatch_main();
}

uint64_t DNDSRunServer()
{
  return _DNDSRunServer();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_main(void)
{
}

{
}

{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}