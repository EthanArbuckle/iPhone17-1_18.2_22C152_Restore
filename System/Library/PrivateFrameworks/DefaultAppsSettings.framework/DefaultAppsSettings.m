uint64_t sub_24CA1BB48()
{
  sub_24CA1BDA0();
  sub_24CA1BD90();
  sub_24CA1BD80();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 1;
}

uint64_t DefaultAppsSettingsProvider.available.getter()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 1;
}

uint64_t sub_24CA1BC58()
{
  return sub_24CA1BC70();
}

uint64_t DefaultAppsSettingsProvider.localizedDetail.getter()
{
  return sub_24CA1BC70();
}

uint64_t sub_24CA1BC68()
{
  return sub_24CA1BC70();
}

uint64_t sub_24CA1BC70()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0;
}

uint64_t DefaultAppsSettingsProvider.localizedNavigationTitle.getter()
{
  return sub_24CA1BC70();
}

uint64_t dispatch thunk of DefaultAppsSettingsProvider.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DefaultAppsSettingsProvider.available.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DefaultAppsSettingsProvider.localizedTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of DefaultAppsSettingsProvider.localizedDetail.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of DefaultAppsSettingsProvider.localizedNavigationTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of DefaultAppsSettingsProvider.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_24CA1BD80()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CA1BD90()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CA1BDA0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}