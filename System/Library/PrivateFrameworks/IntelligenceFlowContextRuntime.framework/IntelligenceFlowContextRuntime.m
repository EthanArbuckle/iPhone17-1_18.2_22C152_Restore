int main(int argc, const char **argv, const char **envp)
{
  sub_100003988();
  sub_100003928();
  sub_100003978();
  return 0;
}

unint64_t sub_100003928()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    sub_100003988();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003978()
{
  return static Daemon.main()();
}

uint64_t sub_100003988()
{
  return type metadata accessor for IntelligenceFlowContextDaemon();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}